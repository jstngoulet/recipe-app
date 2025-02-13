
### Project Overview
This project was completed by [Justin Goulet](https://tizzle.dev?utm_source=github&utm_campaign=fetch-rewards&utm_medium=README) on Thursday, February 13, 2025, per the requirements posted on the [application website](https://d3jbb8n5wk0qxi.cloudfront.net/take-home-project.html). For additional reference, a copy of the [requirements](/README-Assets/requirements/requirements-doc.md) will be included in the project deliverables.

### Summary: 
> Include screen shots or a video of your app highlighting its features

This project is a simple single-page mobile application built with SwiftUI. This application is meant to be a basic project showing an Explore View of various recipes that a user can tap into and view more information regarding. Each subsection below works through the steps of how the project was completed and what features it currently includes.

#### Design
The interface design of the application is fairly simple. The parent page is a list of Recipe cards that display relative information as the user scrolls through the view. Below are the following elements presented: 

- Title
  - This is the name of the recipe
- Subtitle
  - This is the cuisine title of the recipe
  - Note: This could also be a chip presented on the image, but a subtitle was very simple to add and is already in a different component that can easily be transformed.
- Primary Image
  - This is the small icon on the API. While it is a large image, we wanted to showcase the recipe before the user taps on it. Showing the name isnt always enough and by having an image that the user can actually see helps give them a choice up front.
  - In its current form, using the larger image may be more beneficial, but due to optimization techniques, we may not want the larger image used when there are over 60 recipes to be displayed.
- External Link Button
  - This allows the user to view the full reciepe in a webpage
- Video Button
  - This allows the user to view the full reciepe in a video form, posted online.

Screenshots are posted in the below table for dark and light mode images.

| Explore Light                                          | Explore Dark                                         |
| ------------------------------------------------------ | ---------------------------------------------------- |
| ![Light](/README-Assets/screenshots/explore-light.png) | ![Dark](/README-Assets/screenshots/explore-dark.png) |

#### API
The API components of this application are broken down in the following way: 

```REST Client -> Domain -> Request```

> What does that mean?

As part of the requirements, we are only reaching out to a single API. It may be more in the future, so we need to ensure that the application is dynamic enough that it can support multiple requests to multiple sources.

##### REST Client
The **REST Client** enables us to perform multiple dynamic requests while ensuring the data is correctly passed to the domain handler for serialization.

##### Domain
The **Domain** enables us to break apart various requests into a single domain. In our case, we have a domain for the explore page, however, we may eventually create a domain for a single recipe, where various mutations and queries can reside as the functionality expands. 

The Domain allows us to consolidate requests under a single umbrella and ensure related functions stay together, even as the API changes.

An opportunity for the domain is to implement an interface for each request. This would be helpful so that we can easily change recipe requests dynamically and progresively (instead of all at once). An example of this can be found in a different [project](https://github.com/jstngoulet/imageSearch/blob/main/ImageSearch/api/ImageProvider/ImageListProvider.swift) I worked on - one that fetches images from a remote source instead of recipes.

##### Requests
The final part of the puzzle is the Request and Response. Each request is defined by the contract of the requirements on an endpoint basis. This allows us to create multiple requests and formulate the contracts in an easy to manage system. 

Having the requests done this way even allows us to pinpoint different api versions in the request to ensure backwards compatibility in the future (if the backend supports it). We can use properties added onto the request like domain, subdomain and version to ensure this scalability.

Similar to the requests, the responses are defined by a set contract, matching the API. The Domain is the higher entity that merges these two together as we do not want to make the two dependant on each other (in terms of contract overlap or circular dependancies)

Since our API currently has a single response contract, we can even use a helper function in our domain to increase code maintainability.

#### Architecture
This app uses MVVM architecture, following Apple's updated recommended guidelines for SwiftUI. The API is a series of models (objects and functionality) that are tied to a view model (the view model for the list view) then to the view, which is the list.

Components generally do not have a direct view model as the components are rather simple. The exceptions are custom labels (they have a text model for updating the text after creation) and the image view (for custom async image loading and caching) 

### Focus Areas: 
> What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

As part of the project, I wanted to spend more time on the structure and scalability of the project, rather than the UI portions specifically.

While UI is extremely important, it changes all of the time. There are usually mulitple AB tests running, various screens in multiple flows, different layouts, etc, however, it becomes a scalability issue if the project backbone is not setup correctly. 

The core part of the app isn't the API or how it looks. Yes, it is functional and a minimal design, but if a developer can't easily, additional time and resources would be required to make these alterations.

A core component of this application is the architecture. While it may never be perfect, having a solid foundation allows us to scale it futher. The API classes, for example should manage all of the contracts and business logic (if there is any on the client side) so that the view models and views just bind together and display the content in an interactive form.

Primarily, I chose to focus on these areas because I have seen first hand that having a scalable client architecture is just as important as the backend architecture because not only does it reduce onboarding time, context switching time allocation and even enhancement delivery - it also allows for a better user experience allowing developers to increase the quality of the application by testing things individually. 

Keeping a modular scalable architecture is in the interest of both the development team and the user.  


### Time Spent: 
> Approximately how long did you spend working on this project? How did you allocate your time?

This project took about 4-5 hours if completed all at the same time. The following is a breakdown of how I spent my time in the application:

> Times are approximate. Designs includes creation of various components including list, zero state, error state, loading state, etc. The creation of this README is not in the time breakdown. 

| Time    | Description                                                       |
| ------- | ----------------------------------------------------------------- |
| 30 min. | Research into the data, interface design layouts and requirements |
| 5 min   | Project setup and folder structure                                |
| 60 min  | API integration and testing                                       |
| 100 min | Design (different iterations)                                     |
| 60 min  | Documentation generation                                          |
| 45 min  | Tests and refactors to make testing easier                        |


### Trade-offs and Decisions: 
> Did you make any significant trade-offs in your approach?

#### Images
A major tradeoff made was the use of my own caching class instead of using AsyncImage. While AsyncImage has a great deal of out-of-the-box functionality, it only handles caching on the URLSession layer, not before the request is even made. Adding a custom cache allows us to scale this functionality further, and even allows for us to use a third party source, later.

Another tradeoff (albeit smaller) was that the ImageLoader `load` function doesn't throw an error, rather, just returns an error as an image source. The idea behind this was to ensure the actual application didn't have to manage image failures and we wouldn't have to retry failed images multiple times. While this could be built out a bit more, the ImageLoader is functional and reactive, as expected.

One thing to point out is that in the current implementation, if an ImageLoader is created without a URL on an async image, the task cannot be cancelled from within the view, rather the view that calls it. 

#### Labels
Previously, I was able to use UIKit Inheritance to create various label styles. Since this project was purely SwiftUI, and views are structs, I didn't toy with various mecahnisms for breakding down different label designs. While the 3 classes present are faily similar, they could be broken down a bit further. This wasn't done to keep it in the time frame.

#### Tests
The tests created were primarily API based as UI and integration testing was not required. Normally, I woulkdl have at least had tests on the button functionality, even if tapping the cell didn't take the user anywhere.

#### Design
The design is really simple. While I normally sit in Figma and do research on what is being done in the market (or even just following a UI profile). If this was a larger profile application, I would have added filters and sections, breaking down the recipes into various lists, similar to various other marketplaces. This is because having large cells isn't ideal when you are trying to find the perfect match for a user very quickly.

### Weakest Part of the Project: 
> What do you think is the weakest part of your project?

I believe the weakest part of the project is the UI itself. I spent too much time thinking about how it should look, that I probably rewrote it too many times - thus making it look extremely basic. I will spend some more time on this after submission, just as a learning process, but there was definately some things that could be improved on.

As part of the UI, an item that can be looked at again is the TextModel. Ideally, we wouln't need a @State variable and a @ObservedObject, but there is currently a layer of complexity there that was part of the project that may not even need to exist in the first place (we aren't changing text after the cell is displayed, after all).

### Additional Information: 
> Is there anything else we should know? Feel free to share any insights or constraints you encountered.

One item I didn't get to touch on in this project was an analytic integration. I believe analytics are fundamental to launching a production application as it is imperitive to know how the user is interacting with our product. 

Analytics allow us to know whether a feature was successful and a successful integration would allow us to see every button click (with metadata) that the user interacts with so that we can understand how they are navigating the product. To do this, I would create an integration similar to the API integration, however, coordinate the events through the views as required (view models) so that we can ensure the proper data can be extracted in our product analytics reporting.

Finally, the question of custom caching was presented as the version of iOS 16 was given (not a constraint, however), however, it wasn't explicitly stated we couldn't use AsyncImage. I did both, taking out the original in my custom image view. 

The question arose as the instructions noted that we should be up to date on our tech stack and AsyncImage wasn't included until SwiftUI iOS 15. In addition, when I was creating my custom caching class, I could have used various caching methods on URLSessionConfiguration, but there was overlap in the requirements. I was stuck between 3 possible implementations (AsyncImage, Custom loaoder with cache and session config, and just a custom loader with cache and shared URLSessionConfiguration)  

Overall, this project was a fun project to work on and provided a great way to demonstrate my skills. While the code may not appear complex, I believe code is complex not in how it's written, but also how it can be read. The best code can be read by both beginners and experts alike - and well documented on `why` and `how` particular actions are taken (self documenting just focuses on the `what`).