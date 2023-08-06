#if os(macOS) || os(iOS)
/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A matrix multiply function.
*/

import Accelerate

@available(iOS 16.4, macOS 13.3, *)
extension Matrix {
    
    /// Calculates `CblasColMajor` matrix multiply, `c = a * b`.
    ///
    /// - Parameter a: The `a`  in  `c = a * b`.
    /// - Parameter b: The `b`  in  `c = a * b`.
    /// - Parameter c: The `c`  in  `c = a * b`.
    /// - Parameter k: Override for the number of columns in matrix _A_ and number of rows in matrix _B_.
    public static func multiply(a: Matrix,
                                b: Matrix,
                                c: Matrix,
                                k: Int32? = nil) {

        cblas_sgemm(CblasColMajor,
                    CblasNoTrans, CblasNoTrans,
                    a.m,
                    b.n,
                    k ?? b.m,
                    1,
                    a.data.baseAddress, a.m,
                    b.data.baseAddress, b.m,
                    0,
                    c.data.baseAddress, c.m)
    }
}
#endif

