# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index show]
      before_action :set_project, only: %i[show update destroy]

      def index
        @projects = policy_scope(Project).order('date DESC')
        authorize @projects
        render json: @projects, status: :ok
      end

      def show
        render json: render_json, status: :ok
      end

      def create
        @project = Project.new(project_params)
        authorize @project
        if @project.save
          render json: render_json, status: :created
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      def update
        if @project.update(project_params)
          render json: render_json, status: :ok
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @project.destroy
          head :no_content
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      private

      def set_project
        @project = Project.friendly.find(params[:id])
        authorize @project
      end

      def project_params
        params.require(:project).permit(:name, :date, :category, :description, :links,
                                        photos_attributes: %i[id photo remote_photo_url _destroy])
      end

      def render_json
        @project.to_json(except: :thumbnail,
                         include: {photos: {except: :project_id}},
                         methods: %i[next prev])
      end
    end
  end
end
