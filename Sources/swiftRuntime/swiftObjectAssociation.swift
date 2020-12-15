//  
//  swiftObjectAssociation.swift
//  swiftRuntime
//  
//  Created by Xiao Jin on 2020/6/2.
//  Copyright © 2020 debugeek. All rights reserved.
//

import Foundation

public final class ObjectAssociation<T: Any> {

    private let policy: objc_AssociationPolicy

    public init(policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
        self.policy = policy
    }

    public subscript(index: AnyObject) -> T? {
        get { return objc_getAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque()) as? T ?? nil }
        set { objc_setAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque(), newValue, policy) }
    }
    
}
