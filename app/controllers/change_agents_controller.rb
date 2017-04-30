class ChangeAgentsController < ApplicationController
  before_action :set_change_agent, only: [:show, :edit, :update, :destroy]

  # GET /change_agents
  # GET /change_agents.json
  def index
    @change_agents = ChangeAgent.all
  end

  # GET /change_agents/1
  # GET /change_agents/1.json
  def show
  end

  # GET /change_agents/new
  def new
    @change_agent = ChangeAgent.new
  end

  # GET /change_agents/1/edit
  def edit
  end

  # POST /change_agents
  # POST /change_agents.json
  def create
    @change_agent = ChangeAgent.new(change_agent_params)

    respond_to do |format|
      if @change_agent.save
        format.html { redirect_to @change_agent, notice: 'Change agent was successfully created.' }
        format.json { render :show, status: :created, location: @change_agent }
      else
        format.html { render :new }
        format.json { render json: @change_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /change_agents/1
  # PATCH/PUT /change_agents/1.json
  def update
    respond_to do |format|
      if @change_agent.update(change_agent_params)
        format.html { redirect_to @change_agent, notice: 'Change agent was successfully updated.' }
        format.json { render :show, status: :ok, location: @change_agent }
      else
        format.html { render :edit }
        format.json { render json: @change_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /change_agents/1
  # DELETE /change_agents/1.json
  def destroy
    @change_agent.destroy
    respond_to do |format|
      format.html { redirect_to change_agents_url, notice: 'Change agent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_change_agent
      @change_agent = ChangeAgent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def change_agent_params
      params.require(:change_agent).permit(:name, :title, :location, :quote)
    end
end
