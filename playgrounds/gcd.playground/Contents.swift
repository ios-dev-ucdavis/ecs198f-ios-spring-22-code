import Foundation

func run_sync_call(on queue: DispatchQueue) {
    for i in 0...4 {
        print("Ready to submit sync task #\(i)")
        queue.sync {
            // Keep busy
            print("Started sync task #\(i) using thread: \(Thread.current).")
            sleep(2)
            print("Finished sync task #\(i).")
        }
        print("Submitted sync task #\(i)")
    }
}

func run_async_call(on queue: DispatchQueue) {
    for i in 0...4 {
        print("Ready to submit async task #\(i)")
        queue.async {
            // Keep busy
            print("Started async task #\(i) using thread: \(Thread.current).")
            sleep(2)
            print("Finished async task #\(i).")
        }
        print("Submitted async task #\(i)")
    }
}

func run_serial_queue() {
    let serial_queue = DispatchQueue(label: "com.serial_queue.www")

    run_sync_call(on: serial_queue)
//    run_async_call(on: serial_queue)
}

func run_concurrent_queue() {
    let concurrent_queue = DispatchQueue(
        label: "com.concurrent.www",
        attributes: .concurrent
    )
    
    run_sync_call(on: concurrent_queue)
//    run_async_call(on: concurrent_queue)
}

func submit_qos_tasks() {
    let serial_queue = DispatchQueue(
        label: "com.serial_queue.www"
    )
    
    serial_queue.async {
        print("Started task #1 with QoS - Default")
        sleep(2)
        print("Finished task #1")
    }

    serial_queue.async(qos: .background) {
        print("Started task #2 with QoS - Background")
        sleep(2)
        print("Finished task #2")
    }

    serial_queue.async(qos: .userInteractive) {
        print("Started task #3 with QoS - userInteractive")
        sleep(2)
        print("Finished task #3")
    }
}

func run_global_task() {
    DispatchQueue.global(qos: .background).async {
        print("Async Task on the Global queue")
    }
    
    DispatchQueue.global(qos: .background).sync {
        print("Sync Task on the Global queue")
    }
}

class ThreadSafeCollection<Element> {
    private let queue = DispatchQueue(
        label: "www.threadsafe.queue", attributes: .concurrent
    )
    private var _elements: [Element] = []
    
    var elements: [Element] {
        queue.sync {
            self._elements
        }
    }
    
    func append(_ element: Element) {
        queue.async(flags: .barrier) {
            self._elements.append(element)
        }
    }
}

func main() {
//    run_serial_queue()
//    run_concurrent_queue()
//    submit_qos_tasks()
//    run_global_task()
}

main()
























//class SharedData {
//    var shared = 1
//    let queue = DispatchQueue(label: "serial")
//
//    func setSharedValue(to value: Int) {
//        queue.sync {
//            shared = value
//        }
//    }
//
//    func readSharedValue() -> Int {
//        queue.sync {
//            shared
//        }
//    }
//}
