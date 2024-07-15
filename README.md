# ProjecDoc

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Test global reader

### Phoenix LiveView Dynamic Modal Component Assignment

Objective:
Create a versatile LiveView modal component within a Phoenix application that can dynamically display various types of content. The component should be reusable and adaptable to different media formats, such as text, images, and videos.

![]()

For this project, I implemented the `DynamicModalComponent` using `Phoenix.LiveComponent`, a dynamic modal window, along with a title, it accepts an array of media elements (image, text, or video). The modal window closes with an 'X'.

The appearance of the modal input is as follows:

```elixir
@modals [%{
  title: "For Bigger Blazes",
  elementList: [
    %{type: "video", src: "http:...mp4"},
    %{type: "string", value: "HBO GO ... chromecast."}
  ]
}, ... more elements]
```

`DynamicModalComponent` contains the `render()` method with the modal. To render the content, it iterates over the `elementList` and depending on the type, renders a tag. The modal also contains a function to close the modal.

To demonstrate the functionality of the modal, I implemented the page `FirstPage`, which contains the array with mock data and opens and loads a random entry in the modal.

The following features I would like to develop are:

- **Dynamic Styles**: I want to protect the modal from having too many elements; a modal should not have more than three, so it would stop adding elements after the third one. Additionally, when a modal has 3 elements, these are presented with a different style to occupy less space. This would be a great time to make the modal more responsive.

- **Buttons**: After the dynamic styles, I would like to add a button that removes the modal from the list, a "do not show again" button, which would be dynamic, in the input structure it would be a boolean.
