# AdonisJS Auth JWT Reference

Referensi
1. Source 1: https://medium.com/adonisid/implementasi-authentication-di-adonis-e1082d8a7e2a
2. Source 2: https://adonisjs.com/docs/4.1/authentication
3. Source 3: https://www.techiediaries.com/adonis-jwt-authentication/

# AdonisJS Auth JWT Preparation
1. npm install
2. npm install mysql--save
3. Setting .env

# AdonsiJS Auth JWT Step by Step

1. Ketikkan: adonis install @adonisjs/auth di terminal project
  ```bash
    a. pilih JWT
    b. pilih lucid
  ```
2. Buka start/app.js, tambahkan
  ```bash
  const providers = [
    '@adonisjs/auth/providers/AuthProvider'
  ]
  ```
3. Tambahkan middleware di start/kernel.js
  ```bash
  const globalMiddleware = [
    'Adonis/Middleware/AuthInit'
  ]
  ```

  ```bash
  const namedMiddleware = {
    auth: 'Adonis/Middleware/Auth',
    guest: 'Adonis/Middleware/AllowGuestOnly'
  }
  ```

4. Cek pengaturan authentikasi di config/auth.js
  ```bash
  module.exports = {
    authenticator: 'jwt',
    jwt: {
      serializer: 'Lucid',
      model: 'App/Model/User',
      scheme: 'jwt',
      uid: 'email',
      password: 'password',
      options: {
        secret: Config.get('app.appKey'),
        // For additional options, see the table below...
      }
    }
  }
  ```
5. Buat seeder adonis make:seed User dan buka di database/seeds/UserSeeder.js

6. Buat controller, adonis make:controller AuthController, lalu pilih HTTP

7. Membuat method untuk registrasi user. Buka AuthController di app/controller/Http/AuthController.js, tambahkan method untuk registrasi user
  ```bash
  async register({request, response}) {
    let user = new User()
    user.username = request.input('username')
    user.email = request.input('email')
    user.password = request.input('password')

    await user.save()

    return response.status(200).json(user)
  }
  ```
  buka start/routes.js dan tambahkan
  Route.post('/auth/register', 'AuthController.register').prefix('api/v1')
  Coba API dengan postman

8. Membuat method untuk login user. Buka AuthController di app/controller/Http/AuthController.js, tambahkan method untuk login user
  ```bash
  async login({auth, request, response}) {
    let email = request.input('email')
    let password = request.input('password')

    try {
      let data_auth = await auth.authenticator('jwt').withRefreshToken().attempt(email, password)
      if (data_auth) {use('App/Models/Mahasiswa')
        let data_user = await User.findBy('email', email)
        let data = {
          "user": data_user,
          "auth": data_auth
        }
        return response.status(200).json(data)
      }
    } catch (e) {
      return response.status(202).json({"message": "You need to register"})
    }
  }
  ```
  buka start/routes.js dan tambahkan
  Route.post('/auth/login', 'AuthController.login').prefix('api/v1')
  Coba API dengan postman

