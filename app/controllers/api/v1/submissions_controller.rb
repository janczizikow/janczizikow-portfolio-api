# frozen_string_literal: true

module Api
  module V1
    class SubmissionsController < ApplicationController
      skip_before_action :authenticate_user!, only: :create
      before_action :set_submission, only: %i[show destroy]

      def index
        @submissions = policy_scope(Submission.all)
        authorize @submissions
        render json: @submissions, status: :ok
      end

      def show
        render json: @submission, status: :ok
      end

      def create
        @submission = Submission.new(submission_params)
        authorize @submission
        if @submission.save
          render json: @submission, status: :created
        else
          render json: @submission.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @submission.destroy
          head :no_content
        else
          render json: @submission.errors, status: :unprocessable_entity
        end
      end

      private

      def set_submission
        @submission = Submission.find(params[:id])
        authorize @submission
      end

      def submission_params
        params.require(:submission).permit(:name, :email, :message)
      end
    end
  end
end
