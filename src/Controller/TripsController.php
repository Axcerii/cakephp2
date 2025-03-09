<?php
declare(strict_types=1);

namespace App\Controller;

/**
 * Trips Controller
 *
 * @property \App\Model\Table\TripsTable $Trips
 */
class TripsController extends AppController
{
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null|void Renders view
     */
    public function index()
    {
        $query = $this->Trips->find()
            ->contain(['Users']);
        $trips = $this->paginate($query);

        $this->set(compact('trips'));
    }

    /**
     * View method
     *
     * @param string|null $id Trip id.
     * @return \Cake\Http\Response|null|void Renders view
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $trip = $this->Trips->get($id, contain: ['Users', 'Cities']);
        $this->set(compact('trip'));
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $trip = $this->Trips->newEmptyEntity();
    
        if ($this->request->is('post')) {

            $trip = $this->Trips->patchEntity($trip, $this->request->getData(), [
                'associated' => ['Cities']
            ]);
    
            if ($this->Trips->save($trip)) {
                $this->Flash->success(__('Le voyage a été enregistré.'));
                return $this->redirect(['action' => 'index']);
            }
    
            debug($trip->getErrors());
            $this->Flash->error(__('Le voyage n\'a pas pu être enregistré. Veuillez réessayer.'));
        }
    
        $users = $this->Trips->Users->find('list', ['limit' => 200])->all();
        $cities = $this->Trips->Cities->find('list', ['keyField' => 'id', 'valueField' => 'name'])->all();
    
        // Envoyer les données à la vue
        $this->set(compact('trip', 'users', 'cities'));
    }

    /**
     * Edit method
     *
     * @param string|null $id Trip id.
     * @return \Cake\Http\Response|null|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $trip = $this->Trips->get($id, contain: []);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $trip = $this->Trips->patchEntity($trip, $this->request->getData());
            if ($this->Trips->save($trip)) {
                $this->Flash->success(__('The trip has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The trip could not be saved. Please, try again.'));
        }
        $users = $this->Trips->Users->find('list', limit: 200)->all();
        $this->set(compact('trip', 'users'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Trip id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $trip = $this->Trips->get($id);
        if ($this->Trips->delete($trip)) {
            $this->Flash->success(__('The trip has been deleted.'));
        } else {
            $this->Flash->error(__('The trip could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }

    public function beforeFilter(\Cake\Event\EventInterface $event)
{
    parent::beforeFilter($event);

    $this->Authentication->allowUnauthenticated(['index', 'view']);
}
}
