SELECT DISTINCT page_id AS recommended_page
FROM Likes
WHERE page_id IN (SELECT page_id
                  FROM Likes
                  WHERE user_id IN (SELECT DISTINCT user2_id
                                    FROM (SELECT *
                                          FROM Friendship
                                          UNION
                                          SELECT user2_id, user1_id
                                          FROM Friendship) AS temp
                                    WHERE user1_id = 1)
                        AND page_id NOT IN (SELECT DISTINCT page_id
                                            FROM Likes
                                            WHERE user_id = 1));
