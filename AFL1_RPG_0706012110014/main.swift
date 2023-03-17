//
//  File.swift
//  0706012110014-DEVANO-AFL 1
//
//  Created by MacBook Pro on 07/03/23.
//

import Foundation

//install status player dan musuh
var HP = 100
var HPTroll = 250
var HPGolem = 500
var elixsir = 5
var potions = 10
var MP = 50

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
var Name: String?
let letterCharacterSet = CharacterSet.letters

//jika nomor tidak bisa
while Name == nil || Name!.rangeOfCharacter(from: letterCharacterSet.inverted) != nil {
    print("Only input Alphabet")
    Name = readLine()
}
//jika tanpa nama akan masuk sebagai guest
if Name == ""{
    print("Okay, you login as guest\n")
    Name = "Guest"
    //jika ada nama
}else{
    print("Hi \(Name ?? "") Lets play together and have fun 🧙🏼‍♂️\n")
}
//mengecek status dan skill player
func check(){
    print("\n=======================\n")
    print("\nPlayer name : \(Name ?? "")\n\nHP: \(HP)/100\nMP: \(MP)/50\n\nMagic\n - Physical Attack. No mana required. Deal 5pt of damage.\n - Meteor. use 15pt of MP. Deal 50pt Damage.\n - Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n\n Items:\n - Potions x\(potions). Heal 20pt of your HP.\n - Elixsir x\(elixsir). Add 10pt of your MP\n")
    print("Press [return] to go back: ")
    let stat = readLine()
    //kembali
    if stat == ""{
        print("Go Back...")
    }
    
    
}
    //mengisi mana
func elixir(){
    print("\n=======================\n")
    
    print("""
Your MP is \(MP).
Your have \(elixsir) potions left.
Are you sure want to use 1 potion to heal wound? [Y/N]
""")
    let elixsirs = readLine()
    if elixsirs?.uppercased() == "Y"{
        if elixsir <= 0 {
            print("Ups potionmu sudah habis\n")
        }else{
            MP += 20
            if MP > 50{
                MP = 50
            }
            print("Your MP is now : \(MP)")
            elixsir -= 1
            print("You have \(elixsir) left.")
        }
        print("\n=======================\n")
        
    }else if elixsirs?.uppercased() == "N"{
        print("Go Back...")
    }
}
//menyembuhkan HP
func heal(){
    print("\n=======================\n")
    
    print("""
Your HP is \(HP).
Your have \(potions) potions left.
Are you sure want to use 1 potion to heal wound? [Y/N]
""")
    let potion = readLine()
    if potion?.uppercased() == "Y"{
        if potions <= 0 {
            print("Ups potionmu sudah habis\n")
        }else{
            HP += 20
            if HP > 100{
                HP = 100
            }
            
            print("Your HP is now : \(HP)")
            potions -= 1
            print("You have \(potions) left.")
        }
        print("\n=======================\n")
        
    }else if potion?.uppercased() == "N"{
        print("Go Back...")
    }
}
//ke forest
func forest(){
    //install variable permainan
    var scan = 0
    let meteor = 50
    var shield = 0

  
    var isRunning = true
//ketikaq isrunning true maka akan looping disini
    while isRunning{
        let forests : String = """
    Your HP : \(HP)
    Your MP : \(MP)

    😈Name : Troll x1
    😈Health : \(HPTroll)

    Choose your action:
    [1] Physical Attack. No mana required. Deal 5pt of damage.
    [2] Meteor. Use 15pt of MP. Deal 50pt of damage.
    [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.

    [4] Use Potion to heal wound.
    [5] Use Elixsir to plessss mana.
    [6] Scan enemy's vital.
    [7] Flee from battle.

    Your Choice?
    """
        print(forests)
        let choose = readLine()
        
        switch choose?.uppercased(){
            
            //skill 1
        case "1":
            print("\nYou attack the troll ")
            //jika memiliki scan maka damage akan x 2
            if scan > 0 {
                HPTroll -= (5*2)
                print("\nCritical Damage-!!\n")
                scan -= 1
                if HPTroll <= 0{
                    print("Hore-!! You Win The Battle\n")
                    isRunning = false
                    HP = 100
                    MP = 50
                    HPTroll = 250
                }
                //serangan biasa
            }else{
                HPTroll -= 5
                if HPTroll <= 0{
                    print("Hore-!! You Win The Battle\n")
                    isRunning = false
                    HP = 100
                    MP = 50
                    HPTroll = 250
                }
                
            }
         //skill 2
        case "2":
            //jika tidak ada mana
            if MP < 15 {
                print("Ughhh. mana ku habis")
            }else{
                print("\nJurus meteor api... Kaboom-!!")
                //jika ada scan maka damage akan x 2
                if scan > 0 {
                    HPTroll -= (meteor*2)
                    print("\nCritical Damage-!!")
                    scan -= 1
                    if HPTroll <= 0{
                        print("Hore-!! You Win The Battle\n")
                        isRunning = false
                        HP = 100
                        MP = 50
                        HPTroll = 250
                    }
                    //serangan meteot normal
                }else{
                    
                    HPTroll -= meteor
                    if HPTroll <= 0{
                        print("Hore-!! You Win The Battle\n")
                        isRunning = false
                        HP = 100
                        MP = 50
                        HPTroll = 250
                    }
                }
                MP = MP-15
            }
            //skill 3
        case "3":
            if MP < 10 {
                print("Ughhh. mana ku habis")
            }
            //menggunakan shield dan mendapatkan imune terhadap serangan musuh selanjutnya
            else{
                MP-=10
                print("You using shield, -10 MP, You have \(MP) left.")
                print("Troll Cant attack you in 1 turn")
                shield += 2
                
            }
            //heall tetapi musuh tetap ada didepan jadinya akan tetap terkena damage
        case "4":
            print("\nHeal-!! Beware Musuh still didepan mu")
            heal()
            //mengisi mana akan tetapi musuh masih tetap ada didepan maka akan tetap terkena damage
        case "5":
            print("\nElixsir-!! Beware Musuh still didepan mu")
            elixir()
            //scan vital musuh dan musuh masi didepan maka akan tetap terkena damage
        case "6":
            print("\nAwas musuh masi didepan mu, Scaning enemy vital...")
            scan += 1
            //kabur jika memilih selain return maka akan gagal untuk keluar
        case "7":
            print("\nYou feel that if you dont escape soon. you wont be able to countinue the fight.\nyou look around frantivcaly, searching for a way out. you sprint toward the exit, your heart pounding in youyr chest.\n\nyour safe. for now.\nplease [return] to countinue: ")
            let stat = readLine()
            
            if stat == ""{
                isRunning=false
            }else{
                print("Gawat, Kamu membatalkan untuk keluar")
            }
            //harus memilih angka,  jika selain itu maka player seperti kebingungan didepan musuh, dan akan terkena damage
        default:
            print("===================\nPilihlah salah satu\n===================\n")
            print("Hati-hati musuh masih didepanmu")
        }
        //setelah menggunakan skill akan kesini dan jika masih true akan masuk kesini juha
        if isRunning == true{
            if shield > 0 {
                shield -= 1
                print("Troll cant attacking you, you have \(shield) shield left. \n")
            }else{
                //random damage 1-5 dan hp berkurang sesuai angka random
                let randomNumber = Int.random(in: 1...5)
                print("Troll Attacking you, You got damage \(randomNumber)\n")
                HP -= randomNumber
                //jika mati lgsg out dari forest
                if HP <= 0 {
                    print("You Lose The Battle")
                    isRunning = false
                    HP = 100
                    MP = 50
                    HPTroll = 250
                }
            }
            //jika udah false maka akan lghsg out dari forest
        }else{
            print("Go Back...\n")
        }
    }
}
    //ke gunung
func mountain(){
    //istall skill
    var scan = 0
    let meteor = 50
    var shield = 0
  
    var isRunning = true
//jika isrunning masiuh true maka akan looping disini
    while isRunning{
        let mountains : String = """
    Your HP : \(HP)
    Your MP : \(MP)

    😈Name : Golem x1
    😈Health : \(HPGolem)

    Choose your action:
    [1] Physical Attack. No mana required. Deal 5pt of damage.
    [2] Meteor. Use 15pt of MP. Deal 50pt of damage.
    [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.

    [4] Use Potion to heal wound.
    [5] Use Elixsir to plesss mana.
    [6] Scan enemy's vital.
    [7] Flee from battle.

    Your Choice?
    """
        print(mountains)
        let choose = readLine()
        switch choose?.uppercased(){
            //skill 1 serangan biasa
        case "1":
            print("\nYou attack the troll ")
            //jika memiliki scan maka damage akan x 2
            if scan > 0 {
                HPGolem -= (5*2)
                print("\nCritical Damage-!!\n")
                scan -= 1
                if HPGolem <= 0{
                    print("Hore-!! You Win The Battle\n")
                    isRunning = false
                    HP = 100
                    MP = 50
                    HPGolem = 500
                }
                //serangan biasa
            }else{
                HPGolem -= 5
                if HPGolem <= 0{
                    print("Hore-!! You Win The Battle\n")
                    isRunning = false
                    HP = 100
                    MP = 50
                    HPGolem = 500
                }
            }
            //skill 2
        case "2":
            //jika ga puny mana
            if MP < 15 {
                print("Ughhh. mana ku habis, Awas musuh masi didepan mu")
            }else{
                print("\nJurus meteor api... Kaboom-!!")
                //jika scan adamaka damage akan x 2
                if scan > 0 {
                    HPGolem -= (meteor*2)
                    print("\nCritical Damage-!!")
                    scan -= 1
                    if HPGolem <= 0{
                        print("Hore-!! You Win The Battle\n")
                        isRunning = false
                        HP = 100
                        MP = 50
                        HPGolem = 500
                    }
                        //serangan metoer biasa
                }else{
                    HPGolem -= meteor
                    if HPGolem <= 0{
                        print("Hore-!! You Win The Battle\n")
                        isRunning = false
                        HP = 100
                        HPGolem = 500
                    }
                }
                MP = MP-15
            }
            //skill 3
        case "3":
            //jika mana habis
            if MP < 10 {
                print("Ughhh. mana ku habis")
                //menggunakan skill shield akan mendapatkan imune dari serangan musuh
            }else{
                MP-=10
                print("You using shield, -10 MP, You have \(MP) left.")
                print("Golem Cant attack you in 1 turn")
                shield += 2
            }
            //skill heal akan tetapi tetap terkena damage karena musuh masih didepan
        case "4":
            print("\nHeal-!! Beware Musuh still didepan mu")
            heal()
            //skill isii mana akan tetapi tetap terkena damage karena musuh masih didepan
        case "5":
            print("\nElixsir-!! Beware Musuh still didepan mu")
            elixir()
            //scan emeny vital dan mendapatkan scan
        case "6":
            print("\nAwas musuh masi didepan mu, Scaning enemy vital...")
            scan += 1
            //kabur
        case "7":
            print("\nYou feel that if you dont escape soon. you wont be able to countinue the fight.\nyou look around frantivcaly, searching for a way out. you sprint toward the exit, your heart pounding in youyr chest.\n\nyour safe. for now.\nplease [return] to countinue: ")
            let stat = readLine()
            //jika klik return maka akan lgsg keluyar dr gunung, selain itu gagal
            if stat == ""{
                isRunning=false
            }else{
                print("Gawat, Kamu membatalkan untuk keluar")
            }
            // harus memilih salah 1 skill jika selain itu player kebingungan akan terkena damage musuh
        default:
            print("===================\nPilihlah salah satu\n===================\n")
            print("Hati-hati musuh masih didepanmu")
        }
        //setelah menggunakan skill akan kesini
        if isRunning == true{
            //jika mempunyai shiel akan imune
            if shield > 0 {
                shield -= 1
                print("Golem cant attacking you, you have \(shield) shield left. \n")
                //random damage dr musuh 5-10
            }else{
                let randomNumber = Int.random(in: 1...10)
                print("Golem Attacking you, You got damage \(randomNumber)\n")
                HP -= randomNumber
                if HP <= 0 {
                    print("You Lose The Battle")
                    isRunning = false
                    HP = 100
                    MP = 50
                    HPGolem = 500
                    
                }
            }
        }else{
            print("Go Back...\n")
        }
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
