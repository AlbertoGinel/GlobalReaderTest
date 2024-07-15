defmodule ProjecDocWeb.FirstPage do
  use Phoenix.LiveView


  @modals [%{
    title: "For Bigger Blazes",
    elementList: [
      %{type: "video", src: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"},
      %{type: "string", value: "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. For $35.\nLearn how to use Chromecast with HBO GO and more at google.com/chromecast."}
    ]
  },
  %{
    title: "Furiosa: A Mad Max Saga",
    elementList: [
      %{type: "image", src: "https://sfwmagazine.com/wp-content/uploads/2024/06/3624.jpg"},
      %{type: "image", src: "https://imageio.forbes.com/specials-images/imageserve/66744ad8984230fd11826566/Furiosa--A-Mad-Max-Story-review/960x0.png?format=png&width=960"}
    ]
  },
  %{
    title: "Tears of steel",
    elementList: [
      %{type: "image", src: "https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABdAbSVVIGBPUDiVz160cj4JzsU_wumO-vutvAgZoCxUSUEJGO4jRg2T-wvZZvlInb7qwfnK3588eTdUIBewV_Usm2uPbYcz1o9JE.jpg?r=656"},
      %{type: "video", src: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"},
      %{type: "string", value: "Tears of Steel was realized with crowd-funding by users of the open source 3D creation tool Blender. Target was to improve and test a complete open and free pipeline for visual effects in film - and to make a compelling sci-fi film in Amsterdam, the Netherlands."}
    ]
  }
]

  def render(assigns) do

    ~H"""
    <button phx-click="click_show_modal">Show Modal</button>
    <%= if @show_modal do %>
      <.live_component
        module={DynamicModalComponent}
        id="modal"
        content= {@currentContent}
      />
    <% end %>
    """
  end

  def mount(_params, _session, socket) do
    content = Enum.at(@modals, 0)
    show_modal=false
    {:ok, assign(socket, content: content, show_modal: show_modal)}
  end


  #random element in modals for
  def handle_event("click_show_modal", _params, socket) do

    new_index = Enum.random(0..(length(@modals) - 1))

    current_content = Enum.at(@modals, new_index)

    socket =
      socket
      |> assign(:show_modal, true)
      |> assign(:modalIndex, new_index)
      |> assign(:currentContent, current_content)

    {:noreply, socket}
  end

end
