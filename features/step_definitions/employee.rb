#----------------GET------------------------
Dado('que o usuario consulte informacoes de funcionario') do
    @get_url = 'https://dummy.restapiexample.com/api/v1/employees'
end

Quando('ele realizar a pesquisa') do
    @list_employee = HTTParty.get(@get_url)
end

Entao('uma lista de funcionarios deve retornar') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql 'OK'
end


#------------------POST-----------------------
Dado('que o usuario cadastre um nome funcionario') do
    @post_url = 'https://dummy.restapiexample.com/api/v1/create'
end

Quando('ele enviar as informacoes do funcionario') do
    @create_employee = HTTParty.post(@post_url, :headers => {'Content-Type' => 'application/json'}, body:{
        "id": 27,
        "employee_name": "Paulo",
        "employee_salary": 42800,
        "employee_age": 24,
        "profile_image": ""

}.to_json)

    puts @create_employee

end

Entao('esse funcionario sera cadastrado') do
  expect(@create_employee.code).to eql(200)
  expect(@create_employee.message).to eql("OK")

  expect(@create_employee["status"]).to eql("success")
  expect(@create_employee["message"]).to eql("Successfully! Record has been added.")

  expect(@create_employee.parsed_response["data"]["employee_name"]).to eql("Paulo")
  expect(@create_employee.parsed_response["data"]["employee_salary"]).to eql(42800)
  expect(@create_employee.parsed_response["data"]["employee_age"]).to eql(24)
end


#-----------------PUT-------------------
Dado('que o usuario altere uma informacao de  funcionario') do
    @get_employee = HTTParty.get('https://dummy.restapiexample.com/api/v1/employees',  :headers => {'Content-Type' => 'application/json'})
    puts @get_employee['data'][0]['id']
    @put_url = 'https://dummy.restapiexample.com/api/v1/update/10' + @get_employee['data'][0]['id'].to_s
end

Quando('ele enviar as novas informacoes') do
    @update_employee = HTTParty.put(@put_url, :headers => {'Content-Type' => 'application/json'}, body:{
        "employee_name": "Paulo Vilela",
        "employee_salary": 12400,
        "employee_age": 24,
        "profile_image": ""

}.to_json)

    puts(@update_employee)
end

Entao('as informacoes serao alteradas') do
  expect(@update_employee.code).to eql(200)
  expect(@update_employee.message).to eql("OK")

  expect(@update_employee["status"]).to eql("success")
  expect(@update_employee["message"]).to eql("Successfully! Record has been updated.")

  expect(@update_employee.parsed_response["data"]["employee_name"]).to eql("Paulo Vilela")
  expect(@update_employee.parsed_response["data"]["employee_salary"]).to eql(12400)
  expect(@update_employee.parsed_response["data"]["employee_age"]).to eql(24)
end

#-----------------DELETE-------------------

Dado('que o usuario queira deletar um funcionario') do
  @delete_employee = 'https://dummy.restapiexample.com/api/v1/employees'
  @delete_url = 'https://dummy.restapiexample.com/api/v1/delete/' + @get_employee['data'][0]['id'].to_s
end

Quando('ele enviar a identificacao unica') do
   @delete_employee = HTTParty.delete(@delete_url, :headers => {'Content-Type' => 'application/json'})
end

Entao('esse funcionario sera delatado do sistema') do
  expect(@delete_employee.code).to eql(200)
  expect(@delete_employee.message).to eql("OK")

  expect(@delete_employee["status"]).to eql("success")
  expect(@delete_employee.parsed_response["data"]["employee_age"]).to eql(24)
  expect(@delete_employee["message"]).to eql("Successfully! Record has been deleted.")
end