defmodule DynamicModalComponent do
  use Phoenix.LiveComponent

  def render(assigns) do

    ~H"""
    <div class="modal-overlay">
      <div class="modal-container">
        <div class="modal-header">
          <h2><%= @content.title %></h2>
          <button phx-click="close_modal" class="modal-close-button">&times;</button>
        </div>
        <div class="modal-content">
          <%= for element <- @content.elementList do %>
            <%= if element.type == "string" do %>
              <p><%= element.value %></p>
            <% end %>

            <%= if element.type == "image" do %>
              <img src={element.src} alt="An example image">
            <% end %>

            <%= if element.type == "video" do %>
              <div style="position:relative;padding-bottom:56.25%;padding-top:0;height:0;overflow:hidden;">
                <iframe src={element.src} frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="position:absolute;top:0;left:0;width:100%;height:100%;"></iframe>
              </div>
            <% end %>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do

    {:ok, assign(socket, show_modal: false)}
  end

  def handle_event("close_modal", _value, socket) do
    new_show_modal_state = !socket.assigns.show_modal
    {:noreply, assign(socket, :show_modal, new_show_modal_state)}
  end
end
