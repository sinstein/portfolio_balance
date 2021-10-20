require "http"
require "pry"
def execute(filename)
    commands = File.readlines(filename)
    commands.each do |command|
        tokens = command.split(" ")
        case tokens[0]
        when "ALLOCATE"
            allocate(tokens[1], tokens[2], tokens[3])
        when "SIP"
            sip(tokens[1], tokens[2], tokens[3])
        when "CHANGE"
            change(tokens[1], tokens[2], tokens[3])
        when "BALANCE"
            balance(tokens[1])
        when "REBALANCE"
            rebalance()
        else
        end
    end
end

def allocate(eq, db, gd)
    HTTP.post("http://localhost:3000/user_portfolios", :form => {
        'user_id' => 1,
        'equity_value' => eq,
        'debt_value' => db,
        'gold_value' => gd
    })
end

def sip(eq, db, gd)
    HTTP.post("http://localhost:3000/update_sip", :form => {
        'user_id' => 1,
        'equity_sip' => eq,
        'debt_sip' => db,
        'gold_sip' => gd
    })
end

def change(eq, db, gd)
    HTTP.post("http://localhost:3000/market_updates", :form => {
        'equity_change' => eq,
        'debt_change' => db,
        'gold_change' => gd
    })
end

def balance(date)
    puts HTTP.get("http://localhost:3000/user_portfolios.json")
end

def rebalance
    puts HTTP.post("http://localhost:3000/rebalance")
end

execute("input.txt")