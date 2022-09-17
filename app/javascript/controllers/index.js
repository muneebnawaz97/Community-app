// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import EditCommentController from "./edit_comment_controller"
application.register("edit-comment", EditCommentController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import RemoveMemberController from "./remove_member_controller"
application.register("remove-member", RemoveMemberController)

import TurboModalController from "./turbo_modal_controller"
application.register("turbo-modal", TurboModalController)
