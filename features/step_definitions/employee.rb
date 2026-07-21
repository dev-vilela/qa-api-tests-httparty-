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
  expect(@create_employee.code).to eql (200)
  expect(@create_employee.msg).to eql 'ok'
  expect(@create_employee["status"]).to eql 'success'
  expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
  expect(@create_employee.parsed_response['data']["employee_name"]).to eql 'Paulo'
  expect(@create_employee.parsed_response['data']["employee_salary"]).to eql (10200)
  expect(@create_employee.parsed_response['data']["employee_age"]).to eql (24) 
end