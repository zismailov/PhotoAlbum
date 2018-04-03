require "rails_helper"

shared_context "when user with album" do
  let(:user) { create :user, :confirmed }

  let(:root_album) do
    create :album, user: user, parent_album: nil
  end

  let(:child_album) do
    create :child_album, user: user, parent_album: root_album
  end
end
