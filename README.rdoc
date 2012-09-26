== Welcome to QM

QM is an open source Ruby on Rails based qm solution / web application

== License

QM is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License in the subdirectory `doc` along with this program.  If not, see <http://www.gnu.org/licenses/>.

== License in German

QM Programm ist Freie Software: Sie können es unter den Bedingungen der GNU General Public License, wie von der Free Software Foundation, Version 3 der Lizenz oder (nach Ihrer Option) jeder späteren veröffentlichten Version, weiterverbreiten und/oder modifizieren.

Dieses Programm wird in der Hoffnung, dass es nützlich sein wird, aber OHNE JEDE GEWÄHRLEISTUNG, bereitgestellt; sogar ohne die implizite Gewährleistung der MARKTFÄHIGKEIT oder EIGNUNG FÜR EINEN BESTIMMTEN ZWECK. Siehe die GNU General Public License für weitere Details.

Sie sollten eine Kopie der GNU General Public License zusammen mit diesem Programm im Unterverzeichnis `doc` erhalten haben. Wenn nicht, siehe http://www.gnu.org/licenses/.

== Contributors

* Stefan Haslinger: developer and application design
* Walter Kalcher: business logic design and requirements management

* Bundleing of all gems:
   bundle install

No database has to be created manually, because SQLite is used as database engine.

== Installation of Gems

Gems have been installed in the following way. (Need not be done for deployment!)

* Twitter Bootstrap
   rails g bootstrap:install                      # Installation of Twitter Bootstrap
   rails g bootstrap:layout application fluid     # Generates fluid application.html.erb layout

* Cancan
   rails g cancan:ability

* Devise
   rails generate devise:install
   rails generate devise:views
   rails generate devise user
   rake db:migrate

You have to comment out
  # devise_for :users
in +config/routes.rb+ to be able to successfully scaffold
  rails g scaffold User --migration=false

  rails g bootstrap:themed Users

* Simpleform
   rails generate simple_form:install --bootstrap
