require 'test_helper'

class ChildNotesControllerTest < ActionController::TestCase
  setup do
    @child_note = child_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:child_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create child_note" do
    assert_difference('ChildNote.count') do
      post :create, child_note: { body: @child_note.body, title: @child_note.title }
    end

    assert_redirected_to child_note_path(assigns(:child_note))
  end

  test "should show child_note" do
    get :show, id: @child_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @child_note
    assert_response :success
  end

  test "should update child_note" do
    patch :update, id: @child_note, child_note: { body: @child_note.body, title: @child_note.title }
    assert_redirected_to child_note_path(assigns(:child_note))
  end

  test "should destroy child_note" do
    assert_difference('ChildNote.count', -1) do
      delete :destroy, id: @child_note
    end

    assert_redirected_to child_notes_path
  end
end
