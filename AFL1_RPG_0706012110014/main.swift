    //
    //  File.swift
    //  0706012110014-DEVANO-AFL 1
    //
    //  Created by MacBook Pro on 07/03/23.
    //

    import Foundation
    //memanggil class player
    var player = Player(name: "", HP: 100, MP: 50, Potions: 20, Elixsir: 10, scan: 1)
    //memanggil class enemy
    var enemy: Enemy?
    //memanggil class skill
    var skill: Skill?

    //shield
    var perisai = 0
    //install status player dan musuh
    let kataskill : String =
    """

    Choose your action:
    [1] Physical Attack. No mana required. Deal 5pt of damage.
    [2] Meteor. Use 15pt of MP. Deal 50pt of damage.
    [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.

    [4] Use Potion to heal wound.
    [5] Use Elixsir to plessss mana.
    [6] Scan enemy's vital.
    [7] Flee from battle.
    """
    //basic attack
    func attack() -> Int {
        return 10
    }
        //memanggil class skill dan mengatiur mana dan cost mana
    func useSkill(skill: Skill) -> Int {
        if player.MP >= skill.mpCost {
            player.MP -= skill.mpCost
            return skill.damage
        } else {
            return 0
        }
    }

    //input dana name dan aturan name
    func getName() -> String {
        // Keep asking for input until a valid alphabetic string is entered
        while true {
            if let input = readLine(), input.count > 0 {
                // Check if input contains only alphabetic characters
                let isValidInput = input.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
                if isValidInput {
                    return input
                }
            }
            print("Invalid input. Please enter only alphabetic characters.")
        }
    }
    //opening cerita / game
    let openingGame : String = "Welcome to the world of magic! 🧙🏻‍♀️ \n\nYou have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests, mountains, and dungeons, where you will face challenges, make allies, and fight enemies. \n\nPress [return] to continue: "

    //klik return dan jika selain itu akan lgsg exit
    for _ in 1... {
        print(openingGame)
        
        let go = readLine()
        if go == ""{
            break
        }else{
            print("Nice to meet you")
            exit(0)
        }
    }
    //menyimpan nama player dan jika menggunakan nomor tidak bisa
    print("Hello fighter what is your name : ")
    player.name = getName()
    //jika tanpa nama akan masuk sebagai guest
    print("Hi \(player.name) Lets play together and have fun 🧙🏼‍♂️\n")

    //mengecek status dan skill player
    func check(){
        playerStatScreen()
        
    }
    //mengisi mana
    func elixir(){
        //ke class elixsir
        elix()
    }
    //menyembuhkan HP
    func heal(){
        healing()
    }
    //ke forest
    func forest(){
        enemy = Troll()
        guard var enemy = enemy else {
            print("No enemy selected")
            return
        }
        var isBattle = true
        while player.HP > 0 && enemy.healthPoints > 0 && isBattle == true{
            print(
    """

    🧙🏼‍♂️Your HP : \(player.HP)
    🧙🏼‍♂️Your MP : \(player.MP)
    """
            )
    if player.scan >= 2 {
        print("🪡Kamu Memiliki Scan : \(player.scan)\nSemua Damage x2")
    }
    print("""
    😈Name : Troll x1
    😈Health : \(enemy.healthPoints)

        \(kataskill)

    Your Choice?
    """
            )
            let choose = readLine()
            switch choose?.uppercased(){
                //skill 1
            case "1":
                var damage = attack()
                //jika memiliki scan
                if player.scan >= 2 {
                    damage = damage * 2
                    enemy.healthPoints -= damage
                    player.scan -= 1
                }else{
                    enemy.healthPoints -= damage
                }
                print("""
        You attack the troll
        """)
           
                if perisai <= 0 {
                    let enemyDamage = enemy.attack()
                    player.HP -= enemyDamage
                    print("""
            Player takes \(enemyDamage) damage
            """)
                    //jika memiliki shield
                }else{
                    perisai -= 1
                    print("""
    Kamu memiliki shield
    """)
                    
                }
                print("""
        Enemy takes \(damage) damage
        """)
                //skill 2
            case "2":
                var damage = useSkill(skill: Meteor())
                
                if damage > 0 {
                    //jika memiliki scan
                    if player.scan >= 2 {
                        damage *= 2
                        enemy.healthPoints -= damage
                        print("\(player.name) used Meteor and dealt \(damage) damage to Enemy")
                    }else{
                        enemy.healthPoints -= damage
                        print("\(player.name) used Meteor and dealt \(damage) damage to Enemy")
                    }
                } else {
                    print("\(player.name) doesn't have enough MP")
                }
                print("""
        You attack the troll
        """)
                if perisai <= 0 {
                    let enemyDamage = enemy.attack()
                    player.HP -= enemyDamage
                    print("""
            Player takes \(enemyDamage) damage
            """)
                    //jika memiliki shield
                }else{
                    perisai -= 1
                    print("""
    Kamu memiliki shield
    """)
                    
                }
                print("""
        Enemy takes \(damage) damage
        """)
                //skill 3
            case "3":
                let damage = useSkill(skill: Shield())
                if damage > 0 {
                    print("\(player.name) used Shield and blocked enemy's attack")
                    perisai += 1
                } else {
                    print("\(player.name) doesn't have enough MP")
                }
                //heall tetapi musuh tetap ada didepan jadinya akan tetap terkena damage
            case "4":
                healing()
                //mengisi mana akan tetapi musuh masih tetap ada didepan maka akan tetap terkena damage
            case "5":
                print("\nElixsir-!! Beware Musuh still didepan mu")
                elix()
                //scan vital musuh dan musuh masi didepan maka akan tetap terkena damage
            case "6":
                print("\nAwas musuh masi didepan mu, Scaning enemy vital...")
                player.scan += 1
                //kabur jika memilih selain return maka akan gagal untuk keluar
            case "7":
                flee()
                let flee = readLine()
                if flee == ""{
                    isBattle = false
                    print("Go Back...")
                }else{
                    print("Gawat kamu gagal kabur!")
                }
            default:
                print("===================\nPilihlah salah satu\n===================\n")
                print("Hati-hati musuh masih didepanmu")
            }
        }
        //player kalah
        
        if player.HP <= 0 {
            print("Game over! You Lose The Battle")
            exit(0)
            //player menang ke prize
        } else if enemy.healthPoints <= 0 {
            print("Enemy defeated! You Win The Battle")
            prize()
        }else{
            
        }
    }
    //ke gunung
    func mountain(){
        enemy = Golem()
        guard var enemy = enemy else {
            print("No enemy selected")
            return
        }
        var isBattle = true
        while player.HP > 0 && enemy.healthPoints > 0 && isBattle == true{
            print(
    """

    🧙🏼‍♂️Your HP : \(player.HP)
    🧙🏼‍♂️Your MP : \(player.MP)
    """
    )
    if player.scan >= 2 {
        print("🪡Kamu Memiliki Scan : 1\nSemua Damage x2")
    }
    print("""
    😈Name : Golem x1
    😈Health : \(enemy.healthPoints)

        \(kataskill)

    Your Choice?
    """
            )
            let choose = readLine()
            switch choose?.uppercased(){
            case "1":
                var damage = attack()
                //m,emiliki scan
                if player.scan >= 2 {
                    damage = damage * 2
                    enemy.healthPoints -= damage
                    player.scan -= 1
                }else{
                    enemy.healthPoints -= damage
                }
                print("""
        You attack the troll
        """)
                if perisai <= 0 {
                    let enemyDamage = enemy.attack()
                    player.HP -= enemyDamage
                    print("""
            Player takes \(enemyDamage) damage
            """)
                    //memiliki perisai
                }else{
                    perisai -= 1
                    print("""
    Kamu memiliki shield
    """)
                    
                }
                print("""
        Enemy takes \(damage) damage
        """)
                //skill 2
            case "2":
                var damage = useSkill(skill: Meteor())
                
                if damage > 0 {
                    //jika memiliki scan
                    if player.scan >= 2 {
                        damage *= 2
                        enemy.healthPoints -= damage
                        print("\(player.name) used Meteor and dealt \(damage) damage to Enemy")
                    }else{
                        enemy.healthPoints -= damage
                        print("\(player.name) used Meteor and dealt \(damage) damage to Enemy")
                    }
                } else {
                    print("\(player.name) doesn't have enough MP")
                }
                print("""
        You attack the troll
        """)
                if perisai <= 0 {
                    let enemyDamage = enemy.attack()
                    player.HP -= enemyDamage
                    print("""
            Player takes \(enemyDamage) damage
            """)
                }else{
                    perisai -= 1
                    print("""
    Kamu memiliki shield
    """)
                    
                }
                print("""
        Enemy takes \(damage) damage
        """)
                //skill 3
            case "3":
                let damage = useSkill(skill: Shield())
                if damage > 0 {
                    print("\(player.name) used Shield and blocked enemy's attack")
                    perisai += 1
                } else {
                    print("\(player.name) doesn't have enough MP")
                }
                //heall tetapi musuh tetap ada didepan jadinya akan tetap terkena damage
            case "4":
                healing()
                //mengisi mana akan tetapi musuh masih tetap ada didepan maka akan tetap terkena damage
            case "5":
                print("\nElixsir-!! Beware Musuh still didepan mu")
                elix()
                //scan vital musuh dan musuh masi didepan maka akan tetap terkena damage
            case "6":
                print("\nAwas musuh masi didepan mu, Scaning enemy vital...")
                player.scan += 1
                //kabur jika memilih selain return maka akan gagal untuk keluar
            case "7":
                flee()
                let flee = readLine()
                if flee == ""{
                    isBattle = false
                    print("Go Back...")
                }else{
                    print("Gawat kamu gagal kabur!")
                }
            default:
                print("===================\nPilihlah salah satu\n===================\n")
                print("Hati-hati musuh masih didepanmu")
            }
        }
        
        if player.HP <= 0 {
            print("Game over! You Lose The Battle")
            exit(0)
        } else if enemy.healthPoints <= 0 {
            print("Enemy defeated! You Win The Battle")
            prize()
        }else{
            
        }
    }
    //awal pemilihan mau kemana
    let playGame : String = "From here, you can...\n\n[C]heck your healt and stats\n[H]eal you wonds with potion\n[E]lixsir plus your mana\n\nor... choose where you want to go\n\n[F]orest of troll\n[M]ountain of golem\n[Q]uit game\nYour Choice : "
    var isRunning = true

    //akan looping disni sampai quit dari game
    while isRunning{
        print(playGame)
        let choose = readLine()
        
        switch choose?.uppercased(){
        case "C":
            check()
        case "H":
            heal()
        case "E":
            elixir()
        case "F":
            print("Entering to the forest...\n")
            print("""
    As you enter the forest, you feel a sense of unesea wash over you.
    Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around. and find Troll😈 emerging from shadows.

    """)
            forest()
        case "M":
            print("Entering to the mountain")
            print("""
    As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.\n

    """)
            
            mountain()
        case "Q":
            isRunning=false
        default:
            print("Pilihlah salah satu")
        }
    }
