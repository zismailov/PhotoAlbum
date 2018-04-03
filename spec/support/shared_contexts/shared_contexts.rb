require "rails_helper"

shared_context "when user with album" do
  let(:user) { create :user, :confirmed }

  let(:root_album) {
    create :album,
      user: user,
      parent_album: nil
  }

  let(:child_album) {
    create :child_album,
      user: user,
      parent_album: root_album
  }
end