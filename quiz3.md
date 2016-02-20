1. 請解釋 database.yml, routes.rb, 和 Gemfile 分別是什麼？ 他們分別在一個 Rails 專案裡的什麼位置？ 他們為什麼對一個 Rails 專案如此重要？

  #### ANS:
  ```
  database.yml
  ror_project/config/database.yml

  routes.rb
  ror_project/config/database.yml

  Gemfile
  ror_project/Gemfile
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
  C: Create
  R: Read
  U: Update
  D: Delete    
  ```

4. 請問在 routes.rb 裡面加入以下程式碼會產生出哪一些 url？ (提示：在 browser 輸入```http://localhost:3000/rails/info/routes```)
  ```ruby
  resources :users
  ```
  #### ANS:
  ```
  ```

5. 請解釋 model 檔案和 migration 檔案的差別
  #### ANS:
  ```
  Model 檔:
  Migration 檔:
  ```

6. 若今天發現一個 migration 檔寫錯，請問我應該用什麼指令回復到上一個版本的 migration? 
  #### ANS: 
  ```
  $ rake db:rollback

  如有回到上 n 個 migration，則用: 
  $ rake db:rollback STEP=n
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
  ```

9. 若今天需要為 ```Project``` 和 ```Issue``` 這兩個 Model 建立一對多的關係，請寫出實作上所需要的 migratiion 和 model 檔案 
  #### ANS:
  ```
  ```

10. 若今天我有以下 model 檔：
  ```ruby
  class User < ActiveRecord::Base
    has_many :groups_users
    has_many :groups, through: :groups_users 
  end
  ```
  請寫出和這個 model 檔相關連的 model 檔，以及這些 model 檔所需要的資料庫欄位
  #### ANS:
  ```
  ```

11. 延續第10題，如果需要讓一個叫 "Bob" 的使用者產生一個名字叫做 "Rails is Fun" 的社團，應該如何在 rails console 裡實作出來？
  #### ANS:
  ```
  ```

12. 延續第11題，請寫一段程式碼確保使用者在建立新社團時社團名不可以是空白，而且不能超過50個字
  #### ANS:
  ```
  ```