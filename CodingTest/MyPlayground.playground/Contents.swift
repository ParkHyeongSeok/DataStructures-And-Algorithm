import UIKit
//
//class Node<T> {
//    var value: T
//    var next: Node?
//
//    init(value: T, next: Node? = nil) {
//        self.value = value
//        self.next = next
//    }
//}
//
//class LinkedList<T> where T: Equatable {
//
//    // 헤더라는 변수가 포인터 역할을 한다. 그래서 Node<T>?는 최초의 노드가 된다.
//    // 헤더(가리키는 놈)가 있느냐 없느냐?
//    var head: Node<T>?
//
//    // 1) 헤더가 있으면 = 누군가 나를 가리키고 있는 것 = 나를 가리키는 노드가 존재한다. 그렇기 때문에 그 노드가 가장 마지막 노드였기 때문에 마지막 노드를 나로 교체해줘야 한다.
//
//    // 2) 헤더가 없으면 = 누군가 나를 가리키지 않는 것 = 즉 아무런 노드가 존재하지 않음. 실제로 헤더가 없으면(헤더의 주소를 잃어버리면) 자료구조에 접근할 수 없다.
//    // 따라서 헤더를 생성해주고 계속 유지해줘야 한다.
//    // 헤더는 가장 첫 노드의 주소를 가지고 있으며,
//    // 첫 노드에 저장된 다음 노드의 주소에 따라 이동한다.
//    // 한번 이동하면 돌아오지 못한다.
//
//
//    // LinkedList 자료구조를 구현해보자.
//    // 먼저 삽입 구현!
//    func append(value: T) {
//
//        // 링크드 리스트에서 '첫' 데이터를 넣는다? 무슨 의미일까?
//        // 위에 optional로 선언한 head가 없다. 근데 없으면 안된다! 위에서 이야기한 이유 떄문에...
//        // 그래서 가장 먼저는 헤더를 생성해줘야 한다. 이 헤더는 가장 첫 노드의 주소를 가지고 있어야 하기 때문에 첫 노드로 연결된다.
//
//        if head == nil {
//            head = Node(value: value, next: nil)
//            return
//        }
//
//        // 만약 헤더가 존재한다면? 노드의 가장 마지막에 새로운 값을 가진 노드를 추가해준다.
//        // 문제는 마지막을 찾아야 한다는 것
//        // 새로운 값을 가진 노드를 생성하고 추가해준다는 것
//
//        // 마지막을 찾아보자.
//
//        // 헤더의 주소값을 가져오는게 시작이다.
//        var current = head
//
//        // 그래서 그 현재 노드가 가진 포인터가 nil인지 확인한다. 포인터가 nil인 경우는 다음 node가 없다는 뜻이며 즉 마지막이라는 의미이기 때문이다.
//        // 아래 처럼 헤더부터 시작해서 Node의 포인터가 nil일 때까지 찾는다.
//        while current?.next != nil {
//            current = current?.next
//        }
//
//        // 이제 current는 마지막 노드가 되어있을 것이다. 그럼? 그 마지막 노드의 포인터에 새로운 노드를 삽입한다. 역시 이게 마지막 노드가 되기 때문에 nil을 반환
//        current?.next = Node(value: value, next: nil)
//
//        // 이러면 데이터 삽입 끝!
//    }
//
//    func insert(value: T, at index: Int) {
//        if head == nil {
//            head = Node(value: value)
//            return
//        }
//
//        var current = head
//
//        for _ in 0..<index-1 {
//            if current?.next == nil {
//                current = current?.next
//            }
//        }
//
//        let nextNode = current?.next
//        current?.next = Node(value: value)
//        current?.next?.next = nextNode
//    }
//
//    //  모든 노드를 정상적으로 통과하는지 확인할 수 잇따.
//    func displayListItems() {
//        // 역시 헤더의 주소값을 가져오고
//        var current = head
//
//        // 마지막 노드까지 모든 노드에 있는 데이터, value를 출력한다.
//        while current != nil {
//            print(current?.value ?? "")
//            current = current?.next
//        }
//    }
//
//    // 자 그렇다면, 삭제를 구현해보자.
//    func delete(value: T?) {
//
//        // 일단 == 을 사용하기 때문에 제네릭 타입이 equtable을 준수하도록 List에 where절을 넣는다.
//        // 아래 함수의 조건은 헤더의 값이 들어오는 값과 같은가?를 검사하고 있는데... 왜??
//        // 첫 번째 노드를 '잘' 제거하기 위함이다. 링크드리스트에서 헤드는 가장 첫 노드를 가리키고 있기 때문에 만약 삭제할 value가 첫노드라 삭제가 되면... 그 안에 모든 노드가 같이 삭제가 된다. 그래서 그 헤더를 다음으로 옮겨주는 것이 필요하다. 그래야 잘 삭제되는 거겠지?
//        // 링크드리스트에 데이터가 하나밖에 없다? if 문에서 true로 떨어지게 되고, 그러면 next는 nil이 되고 아무런 노드가 존재하지 않게 되고, (원하는 결과)
//        // 헤드 - 1 - 2 - 3 에서 2를 넣는다면? if문에서 걸러지기 때문에 사실상 안에 코드가 작동하지 않게 된다 (이것도 원하는 결과)
//        if head?.value == value {
//            head = head?.next
//        }
//
//        // 하지만 2를 넣었을 때 아무것도 실행되지 않는건 원하는 결과가 아니다. 그래서 이걸 구현해줘야 한다.
//        // 이를 위해서는 이전 노드를 저장할 변수 previous / 현재 노드를 저장할 변수 current가 필요하다.
//        // 전자는 동일하게 선언하면 되고, 후자는 당연히 첫 번째 노드를 가리키는 것에서 시작하는 그래서 이동하는! head가 된다.
//        var previous: Node<T>?
//        var current = head
//
//        // 조건문은 현재 노드가 마지막이 아닌 경우 + 삭제하고자 하는 값이 다른 경우를 의미한다.
//        // 이 말은 사실 삭제할 값을 검색하는 과정으로 볼 수 있다.
//        // 현재 노드가 마지막인 경우는 노드를 옮겨다니면서 검색할 필요가 없다. 또 삭제할 값을 찾았다면 더 이상 검색할 필요가 없다. 그래서 다음과 같은 조건을 내걸면서 첫 노드부터 마지막 노드까지 옮겨다니면서 순서대로 노드를 이어준다.
//        // 노드를 이어주는게 중요한 것이 링크드 리스트에서 삭제는 노드에 연결된 (이전 노드와 또 다음 노드)양쪽의 링크를 끊는 것이기 때문에 이어주는게 중요하다.
//        while current != nil && current?.value != value {
//            previous = current
//            current = current?.next
//        }
//
//        // 빠져나가는 구도
//        // 자 이렇게 이어지다가 마지막에 도달(FF, FT)했다? 그럼 삭제할 값이 없는 것이기 때문에 삭제할 필요없이 마무리되면 된다. 링크드리스트에서는 current가 nil이기 때문에 자연스럽게 마지막 순서를 돌았던 previous가 마지막 노드가 되고 거기에 nil이 들어가기 때문에 자연스럽게 마무리된다.
//
//        // TF의 경우는 삭제할 값을 노드 중간에서 찾은 경우다.
//        // 이 경우는 current의 다음 노드를 이전 노드와 연결시켜주면서 현재 노드에 연결을 제거한다.
//        // 연결이 중간에 끊어진 노드는 자취를 감춘다.
//
//        previous?.next = current?.next
//    }
//
//
//}
//
//let linkedList = LinkedList<Int>()
//linkedList.append(value: 1)
//linkedList.append(value: 2)
//linkedList.append(value: 3)
//
//linkedList.delete(value: 2)
//linkedList.displayListItems()
//

// 떡의 갯수 100만
let N = 4

// 요청한 떡의 총 길이 20억 -> 떡 높이의 총합 항상 M
let M = 6

// 떡의 개별 높이 10억. 양의 정수 or 0
let arr = [19, 15, 10 , 17]

// 적어도 M만큼의 떡을 집에 가져가기 위해 절단기에 설정할 수 있는 높이의 최대값?

// 적절한 높이를 찾아야 한다. => 탐색 => 탐색의 결과에 따라서 높이를 조정한다.
// 현재 이 높이로 자르면 조건을 만족하는가? 확인한 뒤에 조건의 만족 여부에 따라서 탐색 범위를 좁혀서 해결(이진탐색)
// + 절단기의 높이를 탐색하는데 10억... 선형탐색은 생각도 안해야 한다. 이진탐색을 생각

var start = 0
var end = arr.max()!

var result = 0

while start <= end {
    
    let mid = (start + end) / 2
    var total = 0

    for height in arr {
        if height > mid {
            total += height - mid
        }
    }
    
    if total < M {
        end = mid - 1
    } else {
        result = mid
        start = mid + 1
    }
}
print(result)
