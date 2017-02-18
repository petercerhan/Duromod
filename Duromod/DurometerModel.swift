//
//  Scale.swift
//  Duromod
//
//  Created by Peter Cerhan on 1/29/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import Foundation

struct DurometerModel {
    
    //F_0 =
    typealias Properties = (_F_0: Double, r: Double, p_0: Double, k: Double, si: Double, n: Double)
    
    var scale: Scale
    var properties: Properties {
        get {
            switch scale {
            case .shore:
                return (_F_0: 0.549, r: 0.000395, p_0: 0.00254, k: 0.0751, si: 0.0000254,  n: 1)
            case .a:
                return (_F_0: 0.550, r: 0.000395, p_0: 0.00250, k: 0.0750, si: 0.000025, n: 1)
            case .b:
                return (_F_0: 0.550, r: 0.000670, p_0: 0.00250, k: 0.0750, si: 0.000025, n: 2)
            case .c:
                return (_F_0: 0, r: 0.000395, p_0: 0.00250, k: 0.4445, si: 0.000025, n: 1)
            case .d:
                return (_F_0: 0, r: 0.000670, p_0: 0.00250, k: 0.4445, si: 0.000025, n: 2)
            case .o:
                return (_F_0: 0.55, r: 0.00119, p_0: 0.00250, k: 0.0750, si: 0.000025, n: 1.5)
            case .do_:
                return (_F_0: 0, r: 0.00119, p_0: 0.00250, k: 0.4445, si: 0.000025, n: 1.5)
            case .oo:
                return (_F_0: 0.203, r: 0.00119, p_0: 0.00250, k: 0.00908, si: 0.000025, n: 1.5)
            case .m:
                return (_F_0: 0.324, r: 0.000394, p_0: 0.00125, k: 0.00440, si: 0.0000125, n: 2)
            case .e:
                return (_F_0: 0.55, r: 0.0025, p_0: 0.00250, k: 0.0750, si: 0.000025, n: 1.5)
            case .ooo:
                return (_F_0: 0.203, r: 0.00635, p_0: 0.00250, k: 0.00908, si: 0.000025, n: 1.5)
            case .ooo_s:
                return (_F_0: 0.167, r: 0.0107, p_0: 0.0050, k: 0.01765, si: 0.00005, n: 1.5)
            case .cf:
                return (_F_0: 1.0987, r: 0.00635, p_0: 0.0050, k: 0.8829, si: 0.00005, n: 1.5)
            }
        }
    }
    
    func getModulus(measuredHardness s: Double) -> Double {
        let properties = self.properties
        
        let _H = s / 100
        let _F_0 = properties._F_0
        let r = properties.r
        let p_0 = properties.p_0
        let k = properties.k
        let si = properties.si
        let n = properties.n
        
        let a = (3*_F_0) / (8*r*p_0)
        let b = (3*k) / (8*r*si)
        let c = a + b*_H
        let d: Double = pow((1 - _H), -n)
        
        
        return c*d
    }
    
}

//MARK: - Enumerate Scales

extension DurometerModel {
    
    enum Scale: String {
        case shore = "Shore"
        case a = "A"
        case b = "B"
        case c = "C"
        case d = "D"
        case o = "O"
        case do_ = "DO"
        case oo = "OO"
        case m = "M"
        case e = "E"
        case ooo = "OOO"
        case ooo_s = "OOO-S"
        case cf = "CF"
    }
    
    static var allScales: [DurometerModel.Scale] = [.shore,
                                                   .a,
                                                   .b,
                                                   .c,
                                                   .d,
                                                   .o,
                                                   .do_,
                                                   .oo,
                                                   .m,
                                                   .e,
                                                   .ooo,
                                                   .ooo_s,
                                                   .cf]
}

