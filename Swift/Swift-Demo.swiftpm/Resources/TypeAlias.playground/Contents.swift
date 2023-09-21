var tuple1 = (1, true, "Hello")
var namedTuple = (id: 1, isAdmin: true, message: "Hello")

typealias Attack = (name: String, damage: Int)

func attackEnemy(name: String, damage: Int) -> Void{
    print("Attack \(name) hit for \(damage)")
}

func attackEnemy(with attack: Attack) -> Void{
    print("Attack \(attack.name) hit for \(attack.damage)")
}

let attack = ("Rangers", 15)
attackEnemy(with: attack)

typealias AttackClosure = ([Attack]) -> Void

let attackOptions = [("Monster A", 10), ("Monster B", 20)]

func fetchPlayerAttacks(closure: AttackClosure){
    closure(attackOptions)
}

fetchPlayerAttacks { (attackOptions) in
    for attack in attackOptions{
        print("Attack \(attack.name) hit for \(attack.damage)")
    }
    
    for (name, _) in attackOptions{
        print("Attack \(name)")
    }
}


