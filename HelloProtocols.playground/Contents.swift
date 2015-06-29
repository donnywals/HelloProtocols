enum AnimalSize {
    case ExtraSmalll, Small, Medium, Large, ExtraLarge, Huge
}

// before refactoring
class Animal {
    var name: String?
    var size: AnimalSize?
}

class Bird: Animal {
    var legs = 2
    var wings = 2
}

class Reptile: Animal {
    var favoriteTemperature = 37.0
}

class Crocodile: Reptile {
    var legs = 4
}

func walk(animal: Animal) {
    if let a = animal as? Bird {
        println("walking an animal with \(a.legs) legs")
    } else if let a = animal as? Crocodile {
        println("walking an animal with \(a.legs) legs")
    }
}

var bird = Bird()
walk(bird)

// after refactoring 

protocol LeggedAnimal {
    var legs: Int { get set }
}

class BetterBird: Animal, LeggedAnimal {
    var legs = 2
    var wings = 2
}

class BetterCrocodile: Reptile, LeggedAnimal {
    var legs = 4
}

func betterWalk(animal: LeggedAnimal) {
    println("walking an animal with \(animal.legs) legs")
}

var croc = BetterCrocodile()
betterWalk(croc)