#  Nike iOS Sample Code Exercise
While this is a toy project and not a professional product, please be sure to demonstrate your ability to
architect clean, maintainable and self-documenting code. This application will be reviewed by engineers
and be used for discussion topics in future interviews.

## Make a Top 100 Albums app:
Create a sample iPhone app that displays the top 100 albums across all genres using Apple’s RSS
generator found here: <https://rss.itunes.apple.com/en-us>. We look for solid Swift fundamentals, like no
force unwrapped or implicitly unwrapped optionals. Things like performance, testing, compatibility,
version control and code quality are at the top of priorities.

The app should:
- Use Auto Layout
- Use proper threading use
- Display good architecture around parsing the API response into model objects to populate the
UI
- Use modern Swift patterns
The app should _NOT_:
- Use storyboards or nibs
- Use any third-party libraries
- Use force unwrapped or implicitly unwrapped optionals

### Expected behavior:
On launch, the user should see a UITableView showing one album per cell. Each cell should display the
name of the album, the artist, and the album art (thumbnail image). Tapping on a cell should push
another view controller onto the navigation stack where we see a larger image at the top of the screen
and the same information that was shown on the cell, plus genre, release date, and copyright info below
the image. A button should also be included on this second view that when tapped fast app switches to
the album page in the iTunes store. The button should be centered horizontally and pinned 20 points
from the bottom of the view and 20 points from the leading and trailing edges of the view. Unlike the
first one, this “detail” view controller should NOT use a UITableView for layout. 

### FAQs:
What should be the results limit on the RSS Feed generator? 10, 100, or somewhere in between?
Up to you. 100 is fine.
The button on the detail view controller should be &quot;horizontally centered&quot;. Given that the button also
must be 20 points from the bottom, do you mean that it should be vertically centered?
No. It should be horizontally centered between the left and right edges. 20 points from the bottom
specifies its vertical positioning.
Can the app stay in portrait mode or should it also rotate to landscape mode? This doesn&#39;t matter for the
table view controller, but it may matter for the detail view controller.
Up to you. Landscape is not required.

### What to do when completed?
Please provide your application via a link to a public Git repo (GitHub, Gitorious, etc.) and send the
project link back to your recruiter when completed.
