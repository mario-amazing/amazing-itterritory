class UniqIpPostersSearcher
  def self.call
    sql_response = ActiveRecord::Base.connection.execute(sql_query)

    default_hash = Hash.new { |h, k| h[k] = [] }
    sql_response.entries.each_with_object(default_hash) { |tuple, h|
      h[tuple['ip']] << tuple['login']
    }
  end

  private

  def self.sql_query
    <<-SQL
    SELECT uniq_ip_with_user_table.ip, users.login FROM (
      SELECT DISTINCT ip, user_id
      FROM user_ips
      WHERE ip IN (
        SELECT ip FROM (
          SELECT DISTINCT ip,user_id  FROM user_ips
        )
        AS uniq_ip_table
        GROUP BY ip
        HAVING COUNT(*)>1)
    )
    AS uniq_ip_with_user_table
    INNER JOIN users
    ON users.id = uniq_ip_with_user_table.user_id;
    SQL
  end
end
