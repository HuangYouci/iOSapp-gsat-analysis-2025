//
//  IAP.swift
//  myProject01
//
//  Created by 黃宥琦 on 2025/2/20.
//

import StoreKit

enum IAPError: Error {
    case purchaseFailed
    case verificationFailed
    case productNotFound
    case unknown(Error)
}

class IAPManager: NSObject, ObservableObject {
    static let shared = IAPManager()
    
    @Published var products: [Product] = []
    @Published var purchasedProductIDs: Set<String> = []
    @Published var isLoading: Bool = false
    @Published var initializationStatus: InitStatus = .notStarted
    @Published var errorMessage: String?
    
    enum InitStatus {
        case notStarted
        case inProgress
        case completed
        case failed
    }
    
    // 購買狀態回調
    var purchaseCompletion: ((Result<Bool, IAPError>) -> Void)?
    
    private override init() {
        super.init()
        Task {
            await initialize()
        }
    }
    
    @MainActor
    private func initialize() async {
        initializationStatus = .inProgress
        do {
            await fetchProducts()
            await restorePurchases()
            observeTransactionUpdates()
            initializationStatus = .completed
        }
    }
    
    /// 取得商品資訊
    @MainActor
    func fetchProducts() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let productIDs: Set<String> = ["myProject01_userpurchased"] // 你的產品 ID
            print("開始獲取商品...")
            let storeProducts = try await Product.products(for: productIDs)
            print("成功獲取商品: \(storeProducts.count) 個")
            self.products = storeProducts
            
            // 印出獲取到的商品詳情
            for product in storeProducts {
                print("商品ID: \(product.id)")
                print("商品名稱: \(product.displayName)")
                print("商品價格: \(product.displayPrice)")
            }
        } catch {
            print("取得商品詳細錯誤: \(error.localizedDescription)")
            if let skError = error as? SKError {
                print("StoreKit錯誤代碼: \(skError.code.rawValue)")
            }
            self.products = []
            self.errorMessage = error.localizedDescription
        }
    }
    
    /// 購買商品
    func purchase(_ product: Product) async throws {
        print("開始購買商品: \(product.id)")
        do {
            let result = try await product.purchase()
            
            switch result {
            case .success(let verification):
                switch verification {
                case .verified(let transaction):
                    print("購買成功，正在完成交易")
                    // 完成交易
                    await transaction.finish()
                    
                    await MainActor.run {
                        purchasedProductIDs.insert(product.id)
                        purchaseCompletion?(.success(true))
                    }
                    
                case .unverified(_, let error):
                    print("交易驗證失敗: \(error)")
                    throw IAPError.verificationFailed
                }
                
            case .userCancelled:
                print("用戶取消購買")
                throw IAPError.purchaseFailed
                
            case .pending:
                print("購買待處理")
                
            @unknown default:
                print("未知的購買狀態")
                throw IAPError.unknown(NSError(domain: "IAPManager", code: -1))
            }
        } catch {
            print("購買過程發生錯誤: \(error)")
            purchaseCompletion?(.failure(.purchaseFailed))
            throw IAPError.unknown(error)
        }
    }
    
    /// 恢復購買
    @MainActor
    func restorePurchases() async {
        print("開始恢復購買...")
        do {
            for await result in Transaction.currentEntitlements {
                if case .verified(let transaction) = result {
                    print("恢復購買項目: \(transaction.productID)")
                    self.purchasedProductIDs.insert(transaction.productID)
                }
            }
            print("恢復購買完成")
        }
    }
    
    /// 檢查商品是否已購買
    func isPurchased(_ productID: String) -> Bool {
        return purchasedProductIDs.contains(productID)
    }
    
    /// 根據 ID 獲取商品
    func product(for productID: String) -> Product? {
        return products.first(where: { $0.id == productID })
    }
    
    /// 監聽交易更新
    private func observeTransactionUpdates() {
        print("開始監聽交易更新")
        Task.detached { @MainActor in
            for await update in Transaction.updates {
                if case .verified(let transaction) = update {
                    print("接收到交易更新: \(transaction.productID)")
                    // 處理交易更新
                    self.purchasedProductIDs.insert(transaction.productID)
                    await transaction.finish()
                }
            }
        }
    }
    
    /// 格式化價格
    func formattedPrice(for product: Product) -> String {
        return product.displayPrice
    }
}
