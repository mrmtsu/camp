camp = Category.create(name:"キャンプ")
mens = Category.create(name:"メンズ")

camp_tent = camp.children.create(name:"テント")
camp_bomfire = camp.children.create(:name=>"焚火")
camp_tent.children.create([{name:"1~2人用"}, {name:"3~4人用"},{name:"5~6人用"}])
camp_bomfire.children.create([{:name=>"Sサイズ"}, {:name=>"Mサイズ"}, {:name=>"Lサイズ"}])

mens_bottoms = mens.children.create(name:"ボトムス")
mens_jacket = mens.children.create(:name=>"ジャケット/アウター")
mens_bottoms.children.create([{name:"ワイドパンツ"}, {name:"スキニー"},{name:"半パン"},{name:"デニム"}])
mens_jacket.children.create([{name:"ダウン"}, {name:"コート"},{name:"ジャケット"},{name:"フリース"}])