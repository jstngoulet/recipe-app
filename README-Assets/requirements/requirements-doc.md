# Fetch Mobile Take Home Project
Thank you for your interest in Fetch! This take home project reflects the kind of challenges you’ll encounter while working at Fetch.

We are looking to be delighted with what you can do and how your unique perspective can contribute to our team. Use this take home project as an opportunity to demonstrate your strengths.

## Overview
Your task is to build a recipe app that displays recipes from the provided API endpoint.

At a minimum, each recipe should show its name, photo, and cuisine type. You’re welcome to display additional details or sort the recipes in any way you see fit.

The app should allow users to refresh the list of recipes at any time, and you can decide how to implement this in the UI. You’re free to include any additional UI elements you think would enhance the experience, but the app should consist of just one screen displaying the list of recipes.

### Requirements

1. **Swift Concurrency**: Use `async/await` for all asynchronous operations, including API calls and image loading.

2. **No External Dependencies**: Your implementation should rely only on Apple's frameworks. Do not include third-party libraries for networking, image caching, or testing.

3. **Efficient Network Usage**: Load images only when needed in the UI to avoid unnecessary bandwidth consumption. Cache images to disk to minimize repeated network requests, but implement this yourself without relying on any third-party solutions or `URLSession`'s HTTP caching.

4. **Testing**: Include unit tests to demonstrate your approach to testing. Use your judgement to determine what should be tested and the appropriate level of coverage. Focus on testing the core logic of your app (e.g., data fetching and caching). UI and integration tests are not required for this exercise.

5. **SwiftUI**: The app's user interface must be built using SwiftUI. We expect engineers to stay up-to-date on the modern UI tooling available from Apple.

### Endpoints

The following JSON endpoints provide the data for your project.

- All Recipes: https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json

You’ll also find test endpoints to simulate various scenarios.

- Malformed Data: https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json
- Empty Data: https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json

If a recipe is malformed, your app should disregard the entire list of recipes and handle the error gracefully. If the recipes list is empty, the app should display an empty state to inform users that no recipes are available.

### JSON Structure

| Key             | Type   | Required | Notes                                                         |
| --------------- | ------ | -------- | ------------------------------------------------------------- |
| cuisine         | string | yes      | The cuisine of the recipe.                                    |
| name            | string | yes      | The name of the recipe.                                       |
| photo_url_large | string | no       | The URL of the recipes’s full-size photo.                     |
| photo_url_small | string | no       | The URL of the recipes’s small photo. Useful for list view.   |
| uuid            | string | yes      | The unique identifier for the receipe. Represented as a UUID. |
| source_url      | string | no       | The URL of the recipe's original website.                     |
| youtube_url     | string | no       | The URL of the recipe's YouTube video.                        |

```json
{
    "recipes": [
        {
            "cuisine": "British",
            "name": "Bakewell Tart",
            "photo_url_large": "https://some.url/large.jpg",
            "photo_url_small": "https://some.url/small.jpg",
            "uuid": "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
            "source_url": "https://some.url/index.html",
            "youtube_url": "https://www.youtube.com/watch?v=some.id"
        },
        ...
    ]
}
```

### Include a README

Below is a README template to help us understand your approach and decision-making process. Please fill out the following sections as part of your submission and include the README in your project.

```
### Summary: Include screen shots or a video of your app highlighting its features

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

### Weakest Part of the Project: What do you think is the weakest part of your project?

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
Submitting the Final Project
```

When completed, upload your project to a public repository and submit a link to the project through Greenhouse.

## FAQ
### What are you looking for?

We want to know what production-ready code looks like to you. If you had to make some compromises or shortcuts for the sake of time be sure to list them in the README.

### How long should I work on this?

Use your judgement.

### Can I use ChatGPT or other AI code generation tools?

We are big fans of AI and the potential it unlocks for engineers, but kindly ask that you refrain from using tools like ChatGPT, Copilot or similar tools or to generate your solution to the take-home project.

### What minimum versions should I support?

You can decide what minimum version to support. At Fetch, we support iOS 16 and up.