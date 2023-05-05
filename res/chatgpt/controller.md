---
Crafted by [Genie](https://marketplace.visualstudio.com/items?itemName=genieai.chatgpt-vscode)

---

## You

In rails vorrei fare un controller per la classe azienda e la classe codemonkey che estende da  user. Sono legate a delle tabelle nel database user (username primary key, password_digest, tipo),  codemonkye(username primary key, email,nome,cognome,bio,propic,valutazione_media,stato) e azienda(username primary key,email, nome, bio, propic, stato). Vorrei capire come ottenere oggtti da queste, capire se esistono entry, aggiungere oggetti.

## Chatgpt

Per creare i controller per le classi Azienda e Codemonkey che estendono dalla classe User, puoi seguire questi passaggi:

1. Creazione del controller Azienda:
```bash
rails generate controller Aziende
```

2. Creazione del controller Codemonkey:
```bash
rails generate controller Codemonkeys
```

3. Aggiungi le relazioni tra le tabelle nel modello `user.rb`, `azienda.rb` e `codemonkey.rb`:

**user.rb**
```ruby
class User < ApplicationRecord
  # se stai utilizzando la gemma devise, aggiungi :authenticateable
  has_one :azienda, foreign_key: "username", primary_key: "username"
  has_one :codemonkey, foreign_key: "username", primary_key: "username"
end
```

**azienda.rb**
```ruby
class Azienda < ApplicationRecord
  belongs_to :user, foreign_key: "username", primary_key: "username"
end
```

**codemonkey.rb**
```ruby
class Codemonkey < ApplicationRecord
  belongs_to :user, foreign_key: "username", primary_key: "username"
end
```

4. Creazione delle operazioni (CRUD) per ciascun controller:

**aziende_controller.rb**
```ruby
class AziendeController < ApplicationController
  def index
    @aziende = Azienda.all
  end

  def show
    @azienda = Azienda.find_by(username: params[:username])
  end

  def new
    @azienda = Azienda.new
  end

  def create
    @azienda = Azienda.new(azienda_params)
    if @azienda.save
      redirect_to @azienda
    else
      render 'new'
    end
  end

  def edit
    @azienda = Azienda.find_by(username: params[:username])
  end

  ...
  
  private
  
  def azienda_params
    params.require(:azienda).permit(:email, :nome, :bio, :propic, :stato)
  end
end
```

**codemonkeys_controller.rb**
```ruby
class CodemonkeysController < ApplicationController
  def index
    @codemonkeys = Codemonkey.all
  end

  def show
    @codemonkey = Codemonkey.find_by(username: params[:username])
  end

  def new
    @codemonkey = Codemonkey.new
  end

  def create
    @codemonkey = Codemonkey.new(codemonkey_params)
    if @codemonkey.save
      redirect_to @codemonkey
    else
      render 'new'
    end
  end

  def edit
    @codemonkey = Codemonkey.find_by(username: params[:username])
  end

  ...

  private

  def codemonkey_params
    params.require(:codemonkey).permit(:email, :nome, :cognome, :bio, :propic, :valutazione_media, :stato)
  end
end
```

Dopo aver seguito questi passaggi avrai creato i controller per le classi Azienda e Codemonkey che estendono dalla classe User, e potrai effettuare operazioni CRUD su tali oggetti.