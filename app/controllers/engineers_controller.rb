class EngineersController < ApplicationController
  before_action :set_engineer, only: [:show, :edit, :update, :destroy]

  CAREER_NAMES = [
    "プログラマー",
    "プロジェクトマネージャ",
    "プロダクトマネージャ",
    "テストエンジニア",
    "セールスエンジニア",
    "ITコンサルタント",
    "セキュリティエンジニア",
    "データベースエンジニア",
    "インフラエンジニア",
    "Webエンジニア",
    "モバイルエンジニア",
  ];

  STATUS_TITLES = [
    "マーケティング",
    "コンサルティング",
    "アーキテクト",
    "マネジメント",
    "スペシャリスト",
    "デベロップメント",
  ];
  STATUS_BASES = [0, 20, 40, 60, 80];

  # GET /engineers
  # GET /engineers.json
  def index
    @engineers = Engineer.all
    @status_titles = STATUS_TITLES
  end

  # GET /engineers/1
  # GET /engineers/1.json
  def show
    @status_titles = STATUS_TITLES
  end

  # GET /engineers/new
  def new
    @engineer = Engineer.new
  end

  # GET /engineers/1/edit
  def edit
  end

  # POST /engineers
  # POST /engineers.json
  def create
    @engineer = Engineer.new(engineer_params)

    seed = @engineer.name.chars.map{|c| c.ord}.reduce{|p,c| p + c} % 100

    @engineer.career = generate_career(seed)
    @engineer.marketing = generate_status(seed, "m".ord)
    @engineer.consulting = generate_status(seed, "c".ord)
    @engineer.architect = generate_status(seed, "a".ord)
    @engineer.management = generate_status(seed, "M".ord)
    @engineer.specialist = generate_status(seed, "s".ord)
    @engineer.development = generate_status(seed, "d".ord)

    respond_to do |format|
      if @engineer.save
        format.html { redirect_to @engineer, notice: 'Engineer was successfully created.' }
        format.json { render :show, status: :created, location: @engineer }
      else
        format.html { render :new }
        format.json { render json: @engineer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engineers/1
  # PATCH/PUT /engineers/1.json
  def update
    respond_to do |format|
      if @engineer.update(engineer_params)
        format.html { redirect_to @engineer, notice: 'Engineer was successfully updated.' }
        format.json { render :show, status: :ok, location: @engineer }
      else
        format.html { render :edit }
        format.json { render json: @engineer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engineers/1
  # DELETE /engineers/1.json
  def destroy
    @engineer.destroy
    respond_to do |format|
      format.html { redirect_to engineers_url, notice: 'Engineer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engineer
      @engineer = Engineer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def engineer_params
      params.fetch(:engineer, {})
      params.require(:engineer).permit(:name)
    end

    def generate_status(seed, status_seed)
      base = STATUS_BASES[(Random.new(seed * status_seed).rand * 10 % STATUS_BASES.length).to_i]
      base + (Random.new(seed + status_seed).rand * 100 % 20).to_i
    end

    def generate_career(seed)
      CAREER_NAMES[(Random.new(seed).rand * 10 % CAREER_NAMES.length).to_i]
    end

end
