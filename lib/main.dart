import 'package:app_lab1_women/second_screen.dart';
import 'package:app_lab1_women/user.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const WomanLogin(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen([],""),
      },
    );
  }
}

class WomanLogin extends StatefulWidget {
  const WomanLogin({Key? key}) : super(key: key);

  @override
  State<WomanLogin> createState() => _WomanLoginState();
}

class _WomanLoginState extends State<WomanLogin> {
  bool access = false;
  List<User> users = [];

  late TextEditingController controlerUser;
  late TextEditingController controlerPassword;

  @override
  void initState() {
    super.initState();
    controlerUser = TextEditingController(text: "pablo1");
    controlerPassword = TextEditingController(text: "pablo1");
    users.add(User("1", "Pablo1", "pablo1", "pablo1", "pablo1@email.com"));
    users.add(User("2", "Pablo2", "pablo2", "pablo2", "pablo2@email.com"));
    users.add(User("3", "Pablo3", "pablo3", "pablo3", "pablo3@email.com"));
    users.add(User("4", "Pablo4", "pablo4", "pablo4", "pablo4@email.com"));
    users.add(User("5", "Pablo5", "pablo5", "pablo5", "pablo5@email.com"));
  }

  @override
  void dispose() {
    controlerPassword.dispose();
    controlerUser.dispose();
    super.dispose();
  }

  login(String userName, String password) {
    for (var i = 0; i < users.length; i++) {
      if (users[i].userName == userName && users[i].password == password) {
        print("entro");
        controlerPassword.clear();
        controlerUser.clear();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SecondScreen(users,users[i].email),
          ),
        );
      }
    }
 
  }

  @override
  Widget build(BuildContext context) {
    var sizeWindow = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: SizedBox(
            height: sizeWindow.height * 0.75,
            width: sizeWindow.width * 0.80,
            child: Card(
              shadowColor: Color.fromARGB(255, 195, 177, 246),
              elevation: 50,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/fondo2.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: sizeWindow.height * 0.10,
                      width: sizeWindow.width * 0.80,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SocialLoginButton(
                          buttonType: SocialLoginButtonType.google,
                          text: "Entrar con Google",
                          borderRadius: 20.0,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                          child: const Text(
                        "Or",
                        style: TextStyle(
                          color: Color.fromARGB(255, 248, 246, 246),
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: sizeWindow.height * 0.10,
                        width: sizeWindow.width * 0.80,
                        child: TextField(
                            controller: controlerUser,
                            decoration: InputDecoration(
                              fillColor: Colors.white24,
                              prefixIcon: Icon(Icons.person),
                              suffixIcon: IconButton(
                                  onPressed: () => controlerUser.clear(),
                                  icon: Icon(Icons.clear)),
                              labelText: 'Correo',
                              hintText: 'estudiante@una.cr',
                              helperText: 'Ingresa tu corrreo',
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: sizeWindow.height * 0.10,
                        width: sizeWindow.width * 0.80,
                        child: TextField(
                            controller: controlerPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: IconButton(
                                  onPressed: () => controlerPassword.clear(),
                                  icon: Icon(Icons.clear)),
                              labelText: 'Contraseña',
                              helperText: 'Ingresa tu contraseña',
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                            )),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () =>
                            login(controlerUser.text, controlerPassword.text),
                        child: Row(
                          children: const [
                            Icon(Icons.login),
                            Spacer(),
                            Text("Acceder")
                          ],
                        )),
                  
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
