//
//  Scale.swift
//  Duromod
//
//  Created by Peter Cerhan on 1/29/17.
//  Copyright © 2017 Peter Cerhan. All rights reserved.
//

import Foundation

struct DurometerModel {
    
    /*
     F_0 = Force of spring preload (N)
     r = Indentor radius (meters)
     p_0 = Initial indentor protrusion, (meters)
     k = Spring constant (N/DH)
     si = Spring sensitivity (displacement per degree of hardness, meters/DH)
     n = Exponent parameter defined by indentor shape: Conical = 2, Round = 3/2, Flat = 1
     c = Adjustment factor for shape of indentor (1 for flat indentors)
     
     note: DH = "Degree of hardness"
    */
    typealias Properties = (_F_0: Double, r: Double, p_0: Double, k: Double, si: Double, n: Double, c: Double)
    
    var scale: Scale
    var properties: Properties {
        get {
            switch scale {
            case .shore:
                return (_F_0: 0.549, r: 0.000_395, p_0: 0.002_54, k: 0.075_1, si: 0.000_025_4,  n: 1, c: 1)
            case .a:
                return (_F_0: 0.550, r: 0.000_395, p_0: 0.002_50, k: 0.075_0, si: 0.000_025, n: 1, c: 1)
            case .b:
                return (_F_0: 0.550, r: 0.000_670, p_0: 0.002_50, k: 0.075_0, si: 0.000_025, n: 2, c: 3.14)
            case .c:
                return (_F_0: 0, r: 0.000_395, p_0: 0.002_50, k: 0.444_5, si: 0.000_025, n: 1, c: 1)
            case .d:
                return (_F_0: 0, r: 0.000_670, p_0: 0.002_50, k: 0.444_5, si: 0.000_025, n: 2, c: 3.14)
            case .o:
                return (_F_0: 0.55, r: 0.001_19, p_0: 0.002_50, k: 0.075_0, si: 0.000_025, n: 1.5, c: 1.03)
            case .do_:
                return (_F_0: 0, r: 0.001_19, p_0: 0.002_50, k: 0.444_5, si: 0.000_025, n: 1.5, c: 1.03)
            case .oo:
                return (_F_0: 0.203, r: 0.001_19, p_0: 0.002_50, k: 0.009_08, si: 0.000_025, n: 1.5, c: 1.03)
            case .m:
                return (_F_0: 0.324, r: 0.000_394, p_0: 0.001_25, k: 0.004_40, si: 0.000_0125, n: 2, c: 3.69)
            case .e:
                return (_F_0: 0.55, r: 0.002_5, p_0: 0.002_50, k: 0.075_0, si: 0.000_025, n: 1.5, c: 1.5)
            case .ooo:
                return (_F_0: 0.203, r: 0.006_35, p_0: 0.002_50, k: 0.009_08, si: 0.000_025, n: 1.5, c: 2.39)
            case .ooo_s:
                return (_F_0: 0.167, r: 0.010_7, p_0: 0.005_0, k: 0.017_65, si: 0.000_05, n: 1.5, c: 2.19)
            case .cf:
                return (_F_0: 1.098_7, r: 0.006_35, p_0: 0.005_0, k: 0.882_9, si: 0.000_05, n: 1.5, c: 1.69)
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
        let factor = properties.c
        
        let a = (3*_F_0) / (8*r*p_0)
        let b = (3*k) / (8*r*si)
        let c = a + b*_H
        let d: Double = pow((1 - _H), -n)
        
        return c*d*factor
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

