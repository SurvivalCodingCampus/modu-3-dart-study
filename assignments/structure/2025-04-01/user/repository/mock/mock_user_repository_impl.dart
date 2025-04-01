import '../../model/address_model.dart';
import '../../model/company_model.dart';
import '../../model/geo_model.dart';
import '../../model/user_model.dart';
import '../user_repository.dart';
import 'package:collection/collection.dart';

class MockUserRepositoryImpl implements UserRepository {

  @override
  Future<List<User>> getUsers() async {
    return [
      User(id: 1, name: '3name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
      User(id: 1, name: '5name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
      User(id: 1, name: '3name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
      User(id: 1, name: '2name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
      User(id: 1, name: '1name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
      User(id: 1, name: '3name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
      User(id: 1, name: '5name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
      User(id: 1, name: '3name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
      User(id: 1, name: '2name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
      User(id: 1, name: '1name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
      User(id: 1, name: '3name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
      User(id: 1, name: '5name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
      User(id: 1, name: '3name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
      User(id: 1, name: '2name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
      User(id: 1, name: '1name', username: 'username', email: 'email', address: Address(street: 'street', suite: 'suite', city: 'city', zipcode: 'zipcode', geo: Geo(lat: 123, lng: 123,),), phone: 'phone', website: 'website', company: Company(name: 'name', catchPhrase: 'catchPhrase', bs: 'bs'),),
    ];
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    final users = await getUsers();
    final top10Users = users.sorted((a, b) => a.name.compareTo(b.name)).sublist(0,10);
    return top10Users;
  }
}