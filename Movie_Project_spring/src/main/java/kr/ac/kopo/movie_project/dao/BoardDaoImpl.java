package kr.ac.kopo.movie_project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.BoardMaster;
@Repository
public class BoardDaoImpl implements BoardDao {
@Autowired
SqlSession sql;
   @Override
   public List<BoardMaster> list() {
      
      return sql.selectList("BoardMaster.list");
   }

   @Override
   public void add(BoardMaster item) {
      sql.insert("BoardMaster.add",item);
   }

   @Override
   public void createTable(int boardId) {
      BoardMaster item=new BoardMaster();
      item.setBoardId(boardId);
      sql.update("BoardMaster.create_board", item);

   }

   @Override
   public void update(BoardMaster item) {
      sql.update("BoardMaster.update", item);

   }

   @Override
   public BoardMaster item(int boardId) {
      return sql.selectOne("BoardMaster.item", boardId);
   }

   @Override
   public void delete(int boardId) {
      sql.delete("BoardMaster.delete", boardId);

   }

   @Override
   public void deleteTable(int boardId) {
      sql.update("BoardMaster.delete_board", boardId);

   }

   @Override
   public int boardid() {
      return sql.selectOne("BoardMaster.boardid");
   }

}