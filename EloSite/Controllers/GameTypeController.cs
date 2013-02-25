using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EloDataModel;

namespace EloSite.Controllers
{
    public class GameTypeController : Controller
    {
        private EloContainer db = new EloContainer();

        //
        // GET: /GameType/

        public ActionResult Index()
        {
            return View(db.GameTypes.ToList());
        }

        //
        // GET: /GameType/Details/5

        public ActionResult Details(int id = 0)
        {
            GameType gametype = db.GameTypes.Find(id);
            if (gametype == null)
            {
                return HttpNotFound();
            }
            return View(gametype);
        }

        //
        // GET: /GameType/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /GameType/Create

        [HttpPost]
        public ActionResult Create(GameType gametype)
        {
            if (ModelState.IsValid)
            {
                db.GameTypes.Add(gametype);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(gametype);
        }

        //
        // GET: /GameType/Edit/5

        public ActionResult Edit(int id = 0)
        {
            GameType gametype = db.GameTypes.Find(id);
            if (gametype == null)
            {
                return HttpNotFound();
            }
            return View(gametype);
        }

        //
        // POST: /GameType/Edit/5

        [HttpPost]
        public ActionResult Edit(GameType gametype)
        {
            if (ModelState.IsValid)
            {
                db.Entry(gametype).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(gametype);
        }

        //
        // GET: /GameType/Delete/5

        public ActionResult Delete(int id = 0)
        {
            GameType gametype = db.GameTypes.Find(id);
            if (gametype == null)
            {
                return HttpNotFound();
            }
            return View(gametype);
        }

        //
        // POST: /GameType/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            GameType gametype = db.GameTypes.Find(id);
            db.GameTypes.Remove(gametype);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}