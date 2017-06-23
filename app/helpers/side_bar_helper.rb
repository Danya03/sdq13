module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'На главную',
      :icon => 'list',
      :controller => :welcome,
      :action => :index
    }
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'},
    ]} 
    result << {
      :name => 'Формула 1',
      :icon => 'flag',
      :children => [
      {:name => 'Команды',
       :controller => :teams, :action => :index,
       :icon => 'search',
       :class => 'long'},
       {:name => 'Календарь Чемпионата',
        :controller => :calendar_of_the_championships, :action => :index,
        :icon => 'search',
        :class => 'long'}
    ]}
    result
  end

  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles', 'tours', 'excursions'
      ctr.to_s == controller_name.to_s
    else
      false
    end
  end
end
