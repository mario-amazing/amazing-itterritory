# frozen_string_literal: true

class UniqIpPostersSearcher
  def self.call
    sql_response = ActiveRecord::Base.connection.execute(sql_query)

    sql_response.entries.each_with_object({}) do |tuple, h|
      h[tuple['ip']] = tuple['logins'].split(',')
    end
  end

  private

  def self.sql_query
    <<-SQL
      SELECT ip, array_to_string(array_agg(distinct users.login), ',') as logins
      FROM user_ips
      INNER JOIN users
      ON users.id = user_ips.user_id
      GROUP BY ip
      HAVING COUNT(distinct user_id) > 1;
    SQL
  end
end
