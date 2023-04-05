
import Foundation

struct User {
    let userName: String
    let userPassword: String
    let person: Person
    
    static func getInfoForUser() -> User {
        User(userName: "Alexey",
             userPassword: "1234" ,
             person: Person(
                name: "Уилл",
                surname: "Смит",
                dateOfbirth: "25 сентября 1968",
                photo: "person",
                counry: Country(place: "Филадельфия", nationality: "США")
             )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let dateOfbirth: String
    let photo: String
    let counry: Country
    
    var fullName: String {
        name + " " + surname
    }
    

}

struct Country {
    let place: String
    let nationality: String
}
