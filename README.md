# LibraryImplementation
Book Library implementation in Flutter Dart

The book list screen with a plus button in FloatingActionButton

The book addition screen which should open on tapping the plus button on the list screen

The book detail screen which should open on tapping on each item on the list screen.

Book addition:

The UI should take input the following items and store it in firebase:

Book name
Authors (can be multiple)
Publisher name
ISBN number (this should be the key of the list item in firebase)
Book Image URL (There should be a text field where the user can paste the link of any image. The image should be stored in firebase and then retrieved back and be shown as network image)

List UI:
The list UI should show the list of all books added in the database. Each list item should show the following only:

Book name
Author
Picture of the book in the leading of the list tile in a circle avatar
A heart in the trailing of the list tile. This heart should be tappable and should mark/unmark the specific book as favourite in the database and the heart should turn red. So technically, you should have a property called isfavorite in the Book model.

On tapping any specific book, the book details page should open up which should show complete information of the book.

