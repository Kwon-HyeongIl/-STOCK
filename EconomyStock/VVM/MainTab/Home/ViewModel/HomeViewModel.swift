//
//  HomeViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/3/24.
//

import Foundation

@Observable
class HomeViewModel {
    var BR = [EconomicIndicatorCycleData]()
    var CPI = [EconomicIndicatorCycleData]()
    var WDER = [EconomicIndicatorCycleData]()
    var M1 = [EconomicIndicatorCycleData]()
    var M2 = [EconomicIndicatorCycleData]()
    
    // 그래프 X축 연도 필터
    var BRYearFilter: [String] {
        BR
            .filter { $0.time.hasSuffix("01.01") }
            .map { $0.time }
    }
    
    init() {
        initBR()
        initCPI()
        initWDER()
        initM1()
        initM2()
    }

    // 기준금리
    func initBR() {
        EconomicIndicatorManager.requestBR { BR in
            DispatchQueue.main.async {
                self.BR = BR.map { data in
                    var modifiedData = data
                    modifiedData.time = self.formatDateString(data.time, type: .day)
                    
                    return modifiedData
                }
            }
        }
    }
    
    // 소비자물가지수
    func initCPI() {
        EconomicIndicatorManager.requestCPI { CPI in
            DispatchQueue.main.async {
                self.CPI = CPI.map { data in
                    var modifiedData = data
                    modifiedData.time = self.formatDateString(data.time, type: .month)
                    
                    return modifiedData
                }
            }
        }
    }
    
    // 원달러환율
    func initWDER() {
        EconomicIndicatorManager.requestWDER { WDER in
            DispatchQueue.main.async {
                self.WDER = WDER.map { data in
                    var modifiedData = data
                    modifiedData.time = self.formatDateString(data.time, type: .day)
                    
                    return modifiedData
                }
            }
        }
    }
    
    // M1
    func initM1() {
        EconomicIndicatorManager.requestM1 { M1 in
            DispatchQueue.main.async {
                self.M1 = M1.map { data in
                    var modifiedData = data
                    modifiedData.time = self.formatDateString(data.time, type: .month)
                    
                    return modifiedData
                }
            }
        }
    }
    
    // M2
    func initM2() {
        EconomicIndicatorManager.requestM2 { M2 in
            DispatchQueue.main.async {
                self.M2 = M2.map { data in
                    var modifiedData = data
                    modifiedData.time = self.formatDateString(data.time, type: .month)
                    
                    return modifiedData
                }
            }
        }
    }
}
