import requests
import json

# # Realizar una solicitud GET a una API publica
# response = requests.get('https://api.example.com/data')

# # Verificar el codigo de estado de la respuesta
# if response.status_code == 200:
#     # Mostrar el contenido de la respuesta
#     print(response.text)
# else:
#     print('Error en la solicitud: ', response.status_code)


# Definir el token de acceso personal (personal access token)
token = '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'
url = 'https://api.github.com/users/maximiliano1997'

# Especificar el encabezado de autenticacion
headers = {'Authorization': f'token {token}'}

# Realizar una solicitud GET a la API de Github para obtener informacion del usuario
response = requests.get(url, headers=headers)

# Verifixar el codigo de estado de la respuesta
if response.status_code == 200:
    # Mostrar el contenido de la respuesta
    status_code = response.status_code
    data = response.text
    headers = response.headers
    print(status_code)
    user_data = json.loads(data)

    # (login, name, location) = user_data
    print(user_data)
    print('Nombre de usuario: ', user_data["login"])
    print('Nombre Completo: ', user_data['name'])
    print('Ubicacion: ', user_data['location'])
    print(headers)
else:
    print('Error en la solicitud:', response.status_code)


# data = {'nombre': 'Imanol'}
# responseSend = requests.post('send.txt', data=data)
