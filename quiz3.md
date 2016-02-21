1. 請解釋 database.yml, routes.rb, 和 Gemfile 分別是什麼？ 他們分別在一個 Rails 專案裡的什麼位置？ 他們為什麼對一個 Rails 專案如此重要？

  #### ANS:
  ```
  # 假設在一個名為 ror_project 的專案底下

  * database.yml
  設定資料庫。
  位置: ror_project/config/database.yml

  * routes.rb
  設定子網址。
  位置: ror_project/config/routes.rb

  * Gemfile
  設定 (新增 / 刪除 / 設定版本) 會使用到的 Gems 套件。
  位置: ror_project/Gemfile
  ```

2. MVC 架構裡的 M, V, 和 C 分別代表什麼？ 
  #### ANS:
  ```
  M: Model
  V: View
  C: Controller 
  ```

3. 請解釋 CRUD 是哪四個字的縮寫？ 
  #### ANS:
  ```
  C: Create (建立)
  R: Read (讀取)
  U: Update (更新)
  D: Delete (刪除)
  ```

4. 請問在 routes.rb 裡面加入以下程式碼會產生出哪一些 url？ (提示：在 browser 輸入```http://localhost:3000/rails/info/routes```)
  ```ruby
  resources :users
  ```
  #### ANS:
  ```
  users_path
  new_user_path
  edit_user_path
  user_path
  ```

5. 請解釋 model 檔案和 migration 檔案的差別
  #### ANS:
  ```
  Model 檔: 
  - 類別繼承 ActiveRecord::Base。
  - 在 model 檔中設定與資料表之間的關聯(一對一 / 一對多 / 多對多)，或基本 CRUD 的操作、資料驗證等。
  - 可直接編輯，存檔生效。若是在 rails console 的狀態下修改 model 檔，執行 $ reload! 載入。

  Migration 檔: 資料庫遷移。
  - 類別繼承 ActiveRecord::Migration 的子類別。
  - 用來進行資料庫的管理，建立資料表及欄位。
  - 無法直接編輯 migration 檔。如果要變更 migration，必須執行 $ rake db:rollback 後編輯，再次執行 $ rake db:rollback 後，編輯的內容才會生效。
  ```

6. 若今天發現一個 migration 檔寫錯，請問我應該用什麼指令回復到上一個版本的 migration? 
  #### ANS: 
  ```
  $ rake db:rollback

  如果要回到上 n 個 migration，則用: $ rake db:rollback STEP=n
  ```

7. 假設今天
  * 我要在資料庫裡產出一個叫 group 的資料表
  * 裡面包括的欄位名稱和相對應的資料型別是： 
    **name (string)**,
    **description (text)**,
    **members (integer)**
  * 請寫出一個能產生出以上需求的 migration 檔
  
  #### ANS: 
  ```ruby
  class AddGroupTable < ActiveRecord::Migration
    def change
      create_table :posts do |t|
        t.string :name
        t.text :description
        t.integer :members

        t.timestamps
      end
    end
  end
  ```

8. 請解釋什麼是 ActiveRecord? 
  #### ANS: 
  ```
  ActiveRecord: Rails 的 Models 基礎。
  ```

9. 若今天需要為 ```Project``` 和 ```Issue``` 這兩個 Model 建立一對多的關係，請寫出實作上所需要的 migration 和 model 檔案 
  #### ANS:
  
  Migration 檔，請至:
  https://github.com/anndoko/ntu_ror_266_quiz3/tree/master/quiz3_project_issue/db/migrate

  Modle 檔，請至: 
  https://github.com/anndoko/ntu_ror_266_quiz3/tree/master/quiz3_project_issue/app/models
  

10. 若今天我有以下 model 檔：
  ```ruby
  class User < ActiveRecord::Base
    has_many :groups_users
    has_many :groups, through: :groups_users 
  end
  ```
  請寫出和這個 model 檔相關聯的 model 檔，以及這些 model 檔所需要的資料庫欄位
  #### ANS:
  Migration 檔，請至:
  https://github.com/anndoko/ntu_ror_266_quiz3/tree/master/quiz3_user_group/db/migrate

  Modle 檔，請至: 
  https://github.com/anndoko/ntu_ror_266_quiz3/tree/master/quiz3_user_group/app/models

11. 延續第10題，如果需要讓一個叫 "Bob" 的使用者產生一個名字叫做 "Rails Is Fun" 的社團，應該如何在 rails console 裡實作出來？
  #### ANS:
  ```ruby
  # 開啟 rails console
  $ rails c

  # 建立 "Bob" 及 "Rails Is Fun"，各自存於 user1 及 group1 的變數。 
  user1 = User.create(user_name: "Bob")
  group1 = Group.create(group_name: "Rails Is Fun")
  
  # 綁定
  user1.groups << group1

  # 檢查多對多關聯
  user1.groups
  group1.users
  ```

12. 延續第11題，請寫一段程式碼確保使用者在建立新社團時社團名不可以是空白，而且不能超過50個字
  #### ANS:
  ```ruby
  # Validation
  validates :group_name, presence: true
  validates :group_name, length: { maximum: 50 }
  ```