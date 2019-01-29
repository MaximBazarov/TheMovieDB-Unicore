TheMovieDB

Using open API of themoviedb.org create an application with these screens:

### Popular movies
 - Show list of the popular movies using `discovery` endpoint.
 - When a user scrolls to the bottom of the list, then the next page should load if available.

### Search screen
- When a user enters a name of a movie (e.g., "Batman," "Rocky") in the search box and tap on "search " button, then a user should see a new list of movies. (using the `search` endpoint).
- When user taps and focus into the search box, then an auto-suggest list view will display below the search box showing their last ten successful queries (exclude suggestions that return errors or empty).
- When a user selects a suggestion, then the search results of the suggestion will be shown.
- When a user scrolls to the bottom of the list, then the next page should load if available.
- Suggestions should stay persisted. 

### Details screen
- When a user taps on the movie on any list, then the app should navigate to details screen.
- Details screen should display the poster, description and a year of release.

### The Movie cell and detail screen should consist of:
- Movie Poster
- Movie name
- Release date
- Full Movie Overview
