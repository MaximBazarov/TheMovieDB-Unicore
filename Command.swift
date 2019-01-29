
import Foundation


class Command<T> {
    
    let action: (T) -> ()
    
    init(action: @escaping (T) -> ()) {
        self.action = action
    }
    
    func execute(with value: T) {
        action(value)
    }
}

typealias PlainCommand = Command<Void>

extension Command where T == Void {
    func execute() {
        execute(with: ())
    }
}

extension Command {
    /// Creates new plain command with value inside
    ///
    /// - Parameter value: Value to be bound
    /// - Returns: PlainCommand with having `value` when executed
    public
    func bound(to value: T) -> PlainCommand {
        return PlainCommand { self.execute(with: value) }
    }
}

// MARK: Map
extension Command {
    
    func map<U>(transform: @escaping (U) -> T) -> Command<U> {
        return Command<U> { value in self.execute(with: transform(value)) }
    }
}

// MARK: Queueing
extension Command {
    
    public
    func async(on queue: DispatchQueue) -> Command {
        return Command { value in
            queue.async {
                self.execute(with: value)
            }
        }
    }
}
