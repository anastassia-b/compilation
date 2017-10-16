require 'pg'

def execute(sql)
  conn = PG::Connection.open(:dbname => 'lecture')
  query_result = conn.exec(sql).values
  conn.close

  query_result
end


def all_food
  execute("SELECT * FROM food")
end

all_food.each { |food| p food }
