
import Foundation
/*
 Capture List
 캡처 : 클로저 내부에서 외부 변수를 사용하면, 외부 변수를 클로저 내부에 저장하는데, 이것을 캡처한다고 표현함.
 
 기본적으로 클로저에서 외부의 값에 접근하면 Reference Capture함
 Value Type으로 캡처하고 싶다면 ?
 -> 캡처리스트 사용 []
 
 캡처리스트로 캡처하면 Value Type은 Value capture함
 !! Reference type은 reference capture를 함
 */


var closure1: () -> Void = {}
var value1: Int = 0

for _ in 0 ..< 5 {
    value1 += 1
    if value1 == 3 {
        closure1 = { [value1] in // Const value type으로 캡처 - 상수!!
            print("index: \(value1)")
        }
    }
}
closure1()



/*
 Case 1
 */

var value = 0
let closure = {
    /* 여기서 밸류 바꾸면 위도 바뀜 - copy by reference*/
    value += 10
    print(value)
}
closure()
print(value)


/*
 Case 2
 */


class Car {
    var speed = 100.0
    var distance = 100.0
    
    lazy var time: () -> Double = {
        return self.distance / self.speed
    }
    
    lazy var time1: () -> Double = { [weak self] in
        guard let self = self else { return 0.0 }
        return self.distance / self.speed
    }

    lazy var time2: () -> Double = { [unowned self] in
        return self.distance / self.speed
    }

    deinit {
        print("car deinit")
    }
}

var car: Car? = Car()
//car?.time() // time()을 실행하면 car가 deinit 되지 않음
car?.time1()
car?.time2()
car = nil


/*
 time이라는 클로저 내부에서 self를 캡처하고 있기 때문
 
 캡처 대상을 weak, unowned 키워드를 이용해 RC를 올라가지 않게 해서
 강한 참조 사이클 방지 할 수 있음

 weak은 optional 로 설정
 unowned는 해당 객체가 무조건 있다고 가정함. 암시적 추출 옵셔널 타입(타입 뒤에 느낌표 붙여주는 타입) 이라서 필요시 옵셔널 바인딩 가능
 unowned는 캡처 대상의 생명주기가 클로저와 같거나 더 긴 경우에만 사용해야함
 */


