// Playground - noun: a place where people can play

import UIKit
import Typhoon
import XCPlayground

//XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)
var str = "Hello, playground"

class ObjectToAssemble:NSObject {
    var injectedString:String?
}

class ObjectAssembly: TyphoonAssembly {
    func assembleObject() -> AnyObject {
        return TyphoonDefinition.withClass(ObjectToAssemble.self) { (configuration) in
            configuration.injectProperty(Selector("injectedString"), with: "Test")
        }
    }
}


var assembly = ObjectAssembly()
var factory = TyphoonBlockComponentFactory(assembly: assembly)

var assembledObject: AnyObject = factory.componentForKey("assembleObject")
