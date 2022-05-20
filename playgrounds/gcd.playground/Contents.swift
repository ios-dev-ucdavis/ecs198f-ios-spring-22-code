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


func main() {
//    run_serial_queue()
//    run_concurrent_queue()
//    submit_qos_tasks()
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
