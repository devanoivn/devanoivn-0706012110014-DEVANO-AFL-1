//
//  Player.swift
//  0706012110014-DEVANO-AFL 1
//
//  Created by MacBook Pro on 06/04/23.
//

import Foundation
struct Player {
    var name: String
    var HP: Int
    var MP: Int
    var Potions: Int
    var Elixsir: Int
    var scan: Int
    
    init(name: String, HP: Int, MP: Int, Potions: Int, Elixsir: Int, scan: Int) {
        self.name = name
        self.HP = HP
        self.MP = MP
        self.Potions = Potions
        self.Elixsir = Elixsir
        self.scan = scan
    }
}
//status player
func playerStatScreen() {
    
    print("\n=======================\n")
    print("\nPlayer name : \(player.name)\n\nHP: \(player.HP)/100\nMP: \(player.MP)/50\n\nMagic\n - Physical Attack. No mana required. Deal 5pt of damage.\n - Meteor. use 15pt of MP. Deal 50pt Damage.\n - Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n\n Items:\n - Potions x\(player.Potions). Heal 20pt of your HP.\n - Elixsir x\(player.Elixsir). Add 10pt of your MP\n")
    print("Press [return] to go back: ")
    let stat = readLine()
    //kembalia
    if stat == ""{
        print("Go Back...")
    }
}

//kabur
func flee() {
    print("""
    You feel like if you don't escape soon, you won't be able to continue your fight.
    You look around frantically, searching for a way out. You sprint towards an exit, your heart pounding in your chest.
    
    You're safe now, for now.
    
    Press [Return] to continue :
    """)
    
}

//melakukan healing pada player
func healing(){
    print(
"""
Your HP is \(player.HP).
Your have \(player.Potions) potions left.
Are you sure want to use 1 potion to heal wound? [Y/N]
"""
)
let potion = readLine()
    //klik y untuk heal
if potion?.uppercased() == "Y"{
    if player.Potions <= 0 {
        print("Ups potionmu sudah habis\n")
    }else{
        player.HP += 20
        //mamastiakn hp tetap maks 100
        if player.HP > 100{
            player.HP = 100
        }
        
        print("Your HP is now : \(player.HP)")
        player.Potions -= 1
        print("You have \(player.Potions) left.")
    }
    print("\n=======================\n")
    //klik n untuk batal
}else if potion?.uppercased() == "N"{
    print("Go Back...")
}

}


//melakukan elix
func elix(){
    print("""
Your MP is \(player.MP).
Your have \(player.Elixsir) potions left.
Are you sure want to use 1 potion to heal wound? [Y/N]
""")
    let elixsirs = readLine()
    //klik y untuk elix
    if elixsirs?.uppercased() == "Y"{
        if player.Elixsir <= 0 {
            print("Ups potionmu sudah habis\n")
        }else{
            player.MP += 20
            //mamastiakn mp tetap maks 50
            if player.MP > 50{
                player.MP = 50
            }
            print("Your MP is now : \(player.MP)")
            player.Elixsir -= 1
            print("You have \(player.Elixsir) left.")
        }
        print("\n=======================\n")
        //klik n untuk batal
    }else if elixsirs?.uppercased() == "N"{
        print("Go Back...")
    }
}

//mengambil hadiah setelah menang
func prize(){
    print("""
Karena kamu memenangkan pertandingan kamu bisa memilih antara 2 hadiah berikut :
1. Potions Heal x2
2. Elixir x1

Your Choice :
"""
         
    )
    let pilihh = readLine()
    switch pilihh?.uppercased(){
    case "1":
        print("Kamu medapatkan potions Heal 2")
        player.Potions+=2
    case "2":
        print("Kamu medapatkan potions Elixir 1")
        player.Elixsir+=1
    default:
        print("pilihlah salah satu...")
    }
}
